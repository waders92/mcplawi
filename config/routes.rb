Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mcplinks#index'
  resources :events do
    resources :registrations, only: :create
  end
end
