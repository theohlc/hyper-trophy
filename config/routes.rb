Rails.application.routes.draw do
  resources :workouts do
    resources :workouts_exercises, only: [ :new, :edit, :create, :update, :destroy ]
  end

  resources :exercises, only: [ :index, :show ]

  root to: 'dashboards#show'
  
  get "users/:id/exercises", to: 'exercises#index', as: :user_exercises
  get "users/most_workouts", to: 'users#most_workouts', as: :users_most_workouts

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, :skip => [:sessions] 
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
    post 'users/sign_in.user', to: 'users/sessions#create'
  end

  resources :users, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
