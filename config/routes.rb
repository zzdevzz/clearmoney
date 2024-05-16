Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/dashboard', to: "pages#dashboard"
  get '/educational_resources', to: "pages#educational_resources"
  resources :pages, only: [ :education, :dashboard, :new, :show ]
  resources :goals, only: [ :new, :create, :index, :show ]
  resources :investments, only: [ :new, :create, :index, :show ] do
    member do
      get :chart
    end
  end
  resources :debts, only: [ :new, :create, :index ]
  resources :expenses, only: [ :new, :create, :index ]
  resources :savings, only: [ :new, :create, :index]
  resources :incomes, only: [ :new, :create, :index]


end
