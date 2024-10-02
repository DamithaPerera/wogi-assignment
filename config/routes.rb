Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
    namespace :api do
      namespace :v1 do
        post 'auth/login', to: 'authentication#login'
        post 'auth/register', to: 'authentication#register'
        get 'auth/authorize_request', to: 'authentication#authorize_request'

        resources :brands, only: [:index, :create]
        resources :products, only: [:index, :create, :update, :destroy]
        resources :clients, only: [:index, :create]
        resources :cards, only: [:create] do
          member do
            put :cancel
          end
        end
      end
    end
end
