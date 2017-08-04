Rails.application.routes.draw do
  resources :skills
  resources :projects
  resources :ids

  root 'ids#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
