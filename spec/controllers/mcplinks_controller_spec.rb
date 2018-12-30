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
end
