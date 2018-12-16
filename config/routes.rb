Rails.application.routes.draw do
  devise_for :users
  resource :dashboards, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mcplinks#index'
  get '/clubs', to: 'mcplinks#clubs'
  resources :events do
    resources :registrations, only: [:create, :show]
  end
end
