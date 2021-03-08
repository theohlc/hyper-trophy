Rails.application.routes.draw do
  get 'workouts/new'
  get 'workouts/create'
  get 'workouts/update'
  get 'workouts/edit'
  get 'workouts/destroy'
  get 'workouts/index'
  get 'workouts/show'


  root to: 'dashboards#show'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, :skip => [:sessions] 
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  resources :users, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
