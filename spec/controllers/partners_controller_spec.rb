require 'rails_helper'

RSpec.describe PartnersController, type: :controller do
  describe 'partners#new action' do
    it 'should show the new partner form if the user is logged in' do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:ok)
    end
  end
end
