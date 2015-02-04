Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :wods, only: [:show, :new, :create] do
    resources :workouts
  end

  resources :movements, only: [:index, :update, :create]

  resources :users, only: [:index, :show] do
    resources :personal_records, only: [:edit, :update]
    resources :programs, only: [:index, :show]
    resources :statistics, only: [:create, :index, :update]
  end

  scope module: :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :programs, only: [:index, :show]
      resources :wods, only: [:show]
    end
  end
end
