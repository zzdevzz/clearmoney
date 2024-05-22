Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # Defines the root path route ("/")
  # root "posts#index"

  resources :articles, only: [:index]
  get '/dashboard', to: "pages#dashboard"

  get '/about_us', to: "pages#about_us"

  # post '/open_ai', to: 'articles#open_ai'
  post '/open_ai', to: 'articles#open_ai'
  resources :pages, only: [ :education, :dashboard, :new, :show ]
  namespace :dashboard do
    root to: 'pages#dashboard'
    get 'investments', to: 'investments#index', as: :dashboard_investments
  end
  resources :goals
  resources :investments do
    member do
      get :chart
    end
  end
  resources :debts
  resources :expenses
  resources :savings
  resources :incomes
  resources :users, only: [:show]


end
