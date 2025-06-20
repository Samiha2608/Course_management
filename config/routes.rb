# config/routes.rb
Rails.application.routes.draw do
  get "/clear_session", to: "application#clear_session"

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  root to: "home#index"

  namespace :student do
    root "dashboards#dashboards"
    resources :courses, only: [ :index, :show ]
  end

  namespace :admin do
    root "dashboards#dashboard"
    resources :courses
    resources :tags, only: [ :new, :create, :destroy, :update ]
    resources :students, only: [ :index, :show ]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
