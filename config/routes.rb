Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :wods, only: [:show, :new, :create] do
    resources :workouts
  end

  resources :users, only: [:index, :show] do
    resources :personal_records, only: [:edit, :update]
    resources :programs, only: [:show]
    resources :statistics, only: [:create]
  end
end
