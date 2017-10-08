Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
	root to:"schools#index"
  resources :images
  resources :sections
  resources :subjects
  resources :levels
  resources :requests
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
