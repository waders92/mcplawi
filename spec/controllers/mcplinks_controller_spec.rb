require 'rails_helper'

RSpec.describe McplinksController, type: :controller do
  describe 'mcplawi#index action' do
    it 'should render the index page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
