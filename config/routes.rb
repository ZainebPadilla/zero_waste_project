Rails.application.routes.draw do
 
  get 'news', to: 'pages#news'
  get "chartkick/index"
  get "pages/team"
  get "pages/contact"
  get 'legal', to: 'pages#legal'
  
  get 'dashboard', to: 'dashboard#index', as: :user_dashboard
  
  resources :dashboard, only: [:index]
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :contact_form, only: [:new, :create], path: "contact_form"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # CRUD for production
  resources :productions

  # CRUD for raw materials
  resources :raw_materials

  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  root 'home#index'

end
