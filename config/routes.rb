Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "home#index"

  namespace :admin do
    get "dashboards/dashboard"
    resources :courses do
      resources :comments, only: [ :create, :edit, :update, :destroy ], module: :courses
    end
    resources :students, only: [ :index, :show, :destroy ] do
      post :enroll, on: :member
      delete :unregister_from_specific_course, on: :member
      resources :course_enrollments, only: [ :create, :destroy ], module: :students
      resources :comments, only: [ :create, :edit, :update, :destroy ], module: :students
    end
    resources :tags, only: [ :new, :create, :destroy, :update ]
  end

  namespace :student do
    namespace :courses do
      resources :comments, only: [ :create, :edit, :update, :destroy ]
    end
    get "dashboards/dashboards"
    resource :profile, only: [ :show ]
    resources :courses, only: [ :index, :show ] do
      resources :comments, only: [ :create, :edit, :update, :destroy ], module: :courses
    end
  end
end
