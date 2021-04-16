require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
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
    let!(:teacher) { FactoryBot.create :teacher }
    
    it 'create a new teacher' do
        params = {
        name: 'test teacher',
        department: 'EEE',
        grade: 'Asst.prof',
        phone: '9876543210',
        email:'teacher1@test.com' 
        }
        expect { post(:create, params: { teacher: params }) }.to change(Teacher, :count).by(1)
        expect(flash[:notice]).to eq 'Teacher was successfully created.'
       end
    end

    context 'PUT #update' do
    let!(:teacher) { create :teacher }
    it 'should update teacher info' do
        params = {
        name: 'test teacher',
        department: 'EEE',
        grade: 'Asst.prof',
        phone: '9876543210',
        email:'teacher1@test.com' 
        }
       put :update, params: { id: teacher.id, teacher: params }
       teacher.reload
       params.keys.each do |key|
       expect(teacher.attributes[key.to_s]).to eq params[key]
    end
    end
    end

    context 'DELETE #destroy' do
    let!(:teacher) { create :teacher }
    it 'should delete teacher' do
       expect { delete :destroy, params: { id: teacher.id } }.to change(Teacher, :count).by(-1)
       expect(flash[:notice]).to eq 'Teacher was successfully destroyed.'
    end
    end
 end

 #test for teacher
 describe 'Teacher controller specs' do
    login_teacher

    context 'GET #index' do 
       it 'should success and not render to index page' do
       get :index
       expect(response).to have_http_status(302)
       expect(response).not_to render_template :index
       end
    end

    context 'POST #create' do
    let!(:teacher) { FactoryBot.create :teacher }
    it 'not create a new teacher' do
        params = {
        name: 'test teacher',
        department: 'EEE',
        grade: 'Asst.prof',
        phone: '9876543210',
        email:'teacher1@test1.com' 
        }
       expect { post(:create, params: { teacher: params }) }.to change(Teacher, :count).by(0)
       expect(flash[:notice]).not_to eq 'Teacher was successfully created.'
       end
    end

    context 'PUT #update' do
    let!(:teacher) { create :teacher }
    it 'should not update teacher info' do
        params = {
        name: 'test teacher',
        department: 'ECE',
        grade: 'Asst.prof',
        phone: '9876543210',
        email:'teacher1@test1.com' 
        }
       put :update, params: { id: teacher.id, teacher: params }
       teacher.reload
       params.keys.each do |key|
       expect(teacher.attributes[key.to_s]).not_to eq params[key]
    end
    end
    end

    context 'DELETE #destroy' do
    let!(:teacher) { create :teacher }
    it 'should not delete teacher' do
       expect { delete :destroy, params: { id: teacher.id } }.to change(Teacher, :count).by(0)
       expect(flash[:notice]).not_to eq 'Teacher was successfully destroyed.'
    end
    end
 end

  #test for student
  describe 'Student controller specs' do
    login_student

    context 'GET #index' do 
       it 'should success and not render to index page' do
       get :index
       expect(response).to have_http_status(302)
       expect(response).not_to render_template :index
       end
    end

    context 'POST #create' do
    let!(:teacher) { FactoryBot.create :teacher }
    it 'not create a new teacher' do
        params = {
        name: 'test teacher',
        department: 'EEE',
        grade: 'Asst.prof',
        phone: '9876543210',
        email:'teacher1@test1.com' 
        }
       expect { post(:create, params: { teacher: params }) }.to change(Teacher, :count).by(0)
       expect(flash[:notice]).not_to eq 'Teacher was successfully created.'
       end
    end

    context 'PUT #update' do
    let!(:teacher) { create :teacher }
    it 'should not update teacher info' do
        params = {
        name: 'test teacher',
        department: 'ECE',
        grade: 'Asst.prof',
        phone: '9876543210',
        email:'teacher1@test1.com' 
        }
       put :update, params: { id: teacher.id, teacher: params }
       teacher.reload
       params.keys.each do |key|
       expect(teacher.attributes[key.to_s]).not_to eq params[key]
    end
    end
    end

    context 'DELETE #destroy' do
    let!(:teacher) { create :teacher }
    it 'should not delete teacher' do
       expect { delete :destroy, params: { id: teacher.id } }.to change(Teacher, :count).by(0)
       expect(flash[:notice]).not_to eq 'Teacher was successfully destroyed.'
    end
    end
end
end
