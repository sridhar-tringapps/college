require 'rails_helper'

RSpec.describe UsersController, type: :controller do
   describe 'Admin controller specs' do   
      login_admin

      context 'GET #index' do 
         it 'should success and render to index page' do
         get :index
         expect(response).to have_http_status(200)
         expect(response).to render_template :index
         end
      end
   end

   describe 'Teacher controller specs' do   
      login_teacher

      context 'GET #index' do 
         it 'should success and not render to index page' do
         get :index
         expect(response).to have_http_status(302)
         expect(response).not_to render_template :index
         end
      end
   end

   describe 'Student controller specs' do   
      login_student

      context 'GET #index' do 
         it 'should success and not render to index page' do
         get :index
         expect(response).to have_http_status(302)
         expect(response).not_to render_template :index
         end
      end
   end
end
