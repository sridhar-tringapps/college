require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
   
   #testing for admin
   describe 'Admin controller specs' do   
      login_admin

      context 'GET #index' do 
         it 'should success and render to index page' do
         get :index
         expect(response).to have_http_status(200)
         expect(response).to render_template :index
         end
      end

      context 'POST #create' do
      let!(:student) { FactoryBot.create :student }
      
      it 'create a new student' do
         params = {
         name: 'test student',
         department: 'EEE',
         phone: '9876543210',
         email:'student@student1.com'
         }
         expect { post(:create, params: { student: params }) }.to change(Student, :count).by(1)
         expect(flash[:notice]).to eq 'Student was successfully created.'
         end
      end

      context 'PUT #update' do
      let!(:student) { create :student }
      it 'should update student info' do
         params = {
         name: 'student1',
         department: 'ECE',
         phone: '9876543012',
         email:'student1@student1.com' 
         }
         put :update, params: { id: student.id, student: params }
         student.reload
         params.keys.each do |key|
         expect(student.attributes[key.to_s]).to eq params[key]
      end
      end
      end

      context 'DELETE #destroy' do
      let!(:student) { create :student }
      it 'should delete student' do
         expect { delete :destroy, params: { id: student.id } }.to change(Student, :count).by(-1)
         expect(flash[:notice]).to eq 'Student was successfully destroyed.'
      end
      end
   end

   #test for teacher
   describe 'Teacher controller specs' do
      login_teacher

      context 'GET #index' do 
         it 'should success and render to index page' do
         get :index
         expect(response).to have_http_status(200)
         expect(response).to render_template :index
         end
      end

      context 'POST #create' do
      let!(:student) { FactoryBot.create :student }
      it 'create a new student' do
         params = {
         name: 'test student',
         department: 'EEE',
         phone: '9876543210',
         email:'student@student1.com' 
         }
         expect { post(:create, params: { student: params }) }.to change(Student, :count).by(1)
         expect(flash[:notice]).to eq 'Student was successfully created.'
         end
      end

      context 'PUT #update' do
      let!(:student) { create :student }
      it 'should update student info' do
         params = {
         name: 'student1',
         department: 'ECE',
         phone: '9876543120',
         email:'student1@student1.com' 
         }
         put :update, params: { id: student.id, student: params }
         student.reload
         params.keys.each do |key|
         expect(student.attributes[key.to_s]).to eq params[key]
      end
      end
      end

      context 'DELETE #destroy' do
      let!(:student) { create :student }
      it 'should delete student' do
         expect { delete :destroy, params: { id: student.id } }.to change(Student, :count).by(-1)
         expect(flash[:notice]).to eq 'Student was successfully destroyed.'
      end
      end
   end

   #test for student
   describe 'Students controller specs' do
      login_student
      context 'GET #index' do 
         it 'should success and not render to index page' do
         get :index
         expect(response).to have_http_status (302)
         end
      end

      context 'POST #create' do
      let!(:student) { FactoryBot.create :student }
      it 'create a new student' do
         params = {
         name: 'test student',
         department: 'EEE',
         phone: '9876543210',
         email:'student@student1.com' 
         }
         expect { post(:create, params: { student: params }) }.to change(Student, :count).by(0)
         expect(flash[:notice]).not_to eq 'Student was successfully created.'
         end
      end

      context 'PUT #update' do
      let!(:student) { create :student }
      it 'should update student info' do
         params = {
         name: 'student1',
         department: 'ECE',
         phone: '9876543012',
         email:'student1@student1.com' 
         }
         put :update, params: { id: student.id, student: params }
         student.reload
         params.keys.each do |key|
         expect(student.attributes[key.to_s]).not_to eq params[key]
      end
      end
      end

      context 'DELETE #destroy' do
      let!(:student) { create :student }
      it 'should delete student' do
         expect { delete :destroy, params: { id: student.id } }.to change(Student, :count).by(0)
         expect(flash[:notice]).not_to eq 'Student was successfully destroyed.'
      end
      end
   end
end

