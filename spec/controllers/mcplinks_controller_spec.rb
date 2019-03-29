require 'rails_helper'

RSpec.describe McplinksController, type: :controller do
  describe 'mcplawi#index action' do
    it 'should render the index page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'mcplawi#clubs action' do
    it 'should render the club listing page' do
      get :clubs
      expect(response).to have_http_status(:success)
    end
  end

  describe 'mcplawi#officers action' do
    it 'should render the officers page' do
      get :officers
      expect(response).to have_http_status(:success)
    end
  end

  describe 'mcplawi#contact action' do
    it 'should render the contact page' do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

  describe 'mcplawi#confirmation action' do
    it 'should render the confirmation page' do
      get :confirmation
      expect(response).to have_http_status(:success)
    end
  end

  describe 'mcplawi#players action' do
    it 'should render the players page' do
      get :players
      expect(response).to have_http_status(:success)
    end
  end

  describe 'mcplawi#admin action' do
    it 'should require the user to be an admin' do
      user = FactoryBot.create(:user)
      sign_in user

      get :admin
      expect(response).to redirect_to root_path
    end

    it 'should render the admin page if the user is an admin' do
      user = User.create(
        email: 'fakeuser@gmail.com',
        password: 'secretPassword',
        password_confirmation: 'secretPassword',
        admin: 'true'
      )
      sign_in user
      
      get :admin
      expect(response).to have_http_status(:success)
    end
  end
end
