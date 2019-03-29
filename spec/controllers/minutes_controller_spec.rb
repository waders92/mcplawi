require 'rails_helper'

RSpec.describe MinutesController, type: :controller do
  describe 'minutes#index action' do
    it 'should render te index page' do
    get :index
    expect(response).to have_http_status(:success)
    end
  end

  describe 'minutes#new action' do
    it 'should redirect non-admin users to the root page' do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to redirect_to root_path
    end

    it 'should render the new page template to admin users' do
      user = User.create(
        email: 'fakeuser@gmail.com',
        password: 'secretPassword',
        password_confirmation: 'secretPassword',
        admin: 'true'
      )
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
