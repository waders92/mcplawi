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
        email: 'fakeuser@gmail.com',
        password: 'secretPassword',
        password_confirmation: 'secretPassword',
        admin: 'true'
      )
      sign_in user

      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'events#new action' do
    it 'should redirect anyone not admin to root page' do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to redirect_to root_path
    end
  end

  describe 'events#create action' do
    it 'should add the event to the database if the user is logged in' do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { event: {
        event_title: 'Test',
        event_start_date: '2018-09-30',
        event_cost_mcpla: 50,
        event_cost_non_mcpla: 75,
        event_cost_season_pass: 100,
        event_location: 'Test location',
        event_start_time: '2000-01-01 08:30:00',
        registration_close: '1999-12-25 08:30:00'
      } }

      expect(response).to redirect_to admin_path
      event = Event.last
      expect(event.event_title).to eq('Test')
      expect(event.user). to eq(user)
      expect(Event.count).to eq 1
    end
  end

  describe 'events#edit action' do
    it 'should render the edit page to the user' do
      event = FactoryBot.create(:event)
      user = User.create(
        email: 'fakeuser@gmail.com',
        password: 'secretPassword',
        password_confirmation: 'secretPassword',
        admin: 'true'
      )
      sign_in user

      get :edit, params: { id: event.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'events#show action' do
    it 'should render the show page if the event is found' do
      event = FactoryBot.create(:event)
      user = User.create(
        email: 'fakeuser@gmail.com',
        password: 'secretPassword',
        password_confirmation: 'secretPassword',
        admin: 'true'
      )
      sign_in user
      get :show, params: { id: event.id }
      expect(response).to have_http_status(:success)
    end

    it 'should return a 404 if the event is not found' do
      user = User.create(
        email: 'fakeuser@gmail.com',
        password: 'secretPassword',
        password_confirmation: 'secretPassword',
        admin: 'true'
      )
      sign_in user
      get :show, params: { id: '5' }
      expect(response).to have_http_status(:not_found)
    end
  end
end
