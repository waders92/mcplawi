require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  describe 'dashboard#show action' do
    it 'should render the show page' do
      user = FactoryBot.create(:user)

      get :show
      expect(response).to have_http_status(:found)
    end
  end
end
