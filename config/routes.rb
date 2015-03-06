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
    resources :statistics, only: [:create, :index, :update] do
      collection do
        get "movement_stats"
      end
    end
  end

  scope module: :api, defaults: { format: 'json' } do
    namespace :v1 do
      devise_for :users, :controllers => {:registrations => "api/v1/registrations", :sessions => "api/v1/sessions"}
      resources :users, only: [:show]
      resources :programs, only: [:index, :show]
      resources :wods, only: [:show]
    end
  end
end
