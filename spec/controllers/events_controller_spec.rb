require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'events#index action' do
    it 'should render the index page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'events#new action' do
    it 'should show the new event form if the user is an admin' do
      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword',
        admin: 'true'
      )
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'events#new action' do
    it 'should redirect anyone not admin to root page' do
      user = FactoryGirl.create(:user)
      sign_in user

      get :new
      expect(response).to redirect_to root_path
    end
  end
end
