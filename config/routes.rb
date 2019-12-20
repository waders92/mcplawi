Rails.application.routes.draw do
  devise_for :users
  resource :dashboards, only: [:show]
  resources :minutes
  resources :teams
  resources :notes
  resources :teetimes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mcplinks#index'
  get '/clubs', to: 'mcplinks#clubs'
  get 'faq', to: 'mcplinks#faq'
  get '/result_history', to: 'mcplinks#result_history'
  get '/event_archive', to: 'mcplinks#event_archive'
  get '/minute_archive', to: 'mcplinks#minute_archive'
  get '/news_archive', to: 'mcplinks#news_archive'
  get '/teams_archive', to: 'mcplinks#teams_archive'
  get 'admin_wiki', to: 'mcplinks#admin_wiki'
  get 'tee_time_archive', to: 'mcplinks#tee_time_archive'
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
