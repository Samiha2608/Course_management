Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "home#index"

  namespace :admin do
    root "dashboards#dashboard"
    resources :courses do
      resources :comments, only: [ :create, :edit, :update, :destroy ], module: :courses
    end
    resources :students, only: [ :index, :show, :destroy ] do
      resources :comments, only: [ :create, :edit, :update, :destroy ], module: :students
    end
    resources :tags, only: [ :new, :create, :destroy, :update ]
  end

  namespace :student do
    namespace :courses do
      get "comments/create"
      get "comments/edit"
      get "comments/update"
      get "comments/destroy"
    end
    root "dashboards#dashboards"
    resource :profile, only: [ :show ]
    resources :courses, only: [ :index, :show ] do
      resources :comments, only: [ :create, :edit, :update, :destroy ], module: :courses
    end
  end
end
