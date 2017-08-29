Rails.application.routes.draw do
  resources :references
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :blogs do
    resources :comments
  end
  resources :skills
  resources :projects

  root 'skills#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
