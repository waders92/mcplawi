Rails.application.routes.draw do
  devise_for :users
  resource :dashboards, only: [:show]
  resources :minutes
  resources :teams
  resources :notes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mcplinks#index'
  get '/clubs', to: 'mcplinks#clubs'
  get '/admin', to: 'mcplinks#admin'
  get '/players', to: 'mcplinks#players'
  get '/officers', to: 'mcplinks#officers'
  get '/confirmation', to: 'mcplinks#confirmation'
  get '/contact', to: 'mcplinks#contact'
  resources :events do
    resources :registrations, only: %i[create show]
    resources :photos
    resources :partners
  end
end
