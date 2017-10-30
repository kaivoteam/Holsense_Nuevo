Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  get "dash_utp", to: "schools#dash_utp"
  devise_scope :user do
    authenticated :teacher_role do
      root to: 'levels#index', as: :teacher_role
    end
    authenticated :utp_role do
      root to: 'schools#dash_utp', as: :utp_role
    end
    authenticated :superadmin_role do
      root to: 'levels#index', as: :superadmin_role
    end

    root to: 'users/sessions#new', as: :unauthenticated_root
  end

  as :user do
    get 'users/profile/:id', :to => 'users/registrations#show', :as => :profile
  end

  get "my_request", to: "requests#my_request"
  
  #root to: 'users/sessions#new'
  
  resources :sections
  resources :subjects
  resources :levels
  resources :requests
  resources :schools do
    collection do
      get :manual
    end
  end
  resources :images do
    collection do
      get :clean
      get :stop
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
