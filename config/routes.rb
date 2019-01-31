Rails.application.routes.draw do
  devise_for :users
  resource :dashboards, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mcplinks#index'
  get '/clubs', to: 'mcplinks#clubs'
  get '/admin', to: 'mcplinks#admin'
  get '/players', to: 'mcplinks#players'
  get '/confirmation', to: 'mcplinks#confirmation'
  resources :events do
    resources :registrations, only: %i[create show]
    resources :partners, only: %i[new create edit]
  end
end
