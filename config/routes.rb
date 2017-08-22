Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :comments
  devise_for :users
  resources :blogs
  resources :skills
  resources :projects

  root 'skills#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
