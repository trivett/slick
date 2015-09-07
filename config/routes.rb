require 'api_constraints'

Rails.application.routes.draw do

  devise_for :users
  namespace :api, defaults: { format: :json}, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do 
      

      resources :users, only: [:index, :create, :show] do
        get "conversations", to: "users#conversations"
      end
      resources :conversations, only: [:index, :create, :show] do
        get "users", to: "conversations#users"
      end

    end
  end
end
