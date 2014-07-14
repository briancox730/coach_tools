Rails.application.routes.draw do

  root 'users#show'

  devise_for :users

  resources :wods, only: [:show, :new, :create] do
    resources :workouts, only: [:create]
  end

  resources :users, only: [:index, :show] do
    resources :personal_records, only: [:index, :edit, :update]
    resources :programs, only: [:show]
    resources :statistics, only: [:create]
  end
end
