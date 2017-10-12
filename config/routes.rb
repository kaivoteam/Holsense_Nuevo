Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    authenticated :user do
      root to: 'schools#index', as: :authenticated_root
    end

    root to: 'users/sessions#new', as: :unauthenticated_root
  end

  as :user do
    get 'users/profile/:id', :to => 'users/registrations#show', :as => :profile
  end

  get "dash_utp", to: "schools#dash_utp"
  
  root to: 'schools#index'
  
  resources :sections
  resources :subjects
  resources :levels
  resources :requests
  resources :schools
  resources :images do
    collection do
      get :clean
      get :stop
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
