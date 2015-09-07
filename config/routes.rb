require 'api_constraints'

Rails.application.routes.draw do

  devise_for :users
  namespace :api, defaults: { format: :json}, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do 
      

      resources :users, only: [:index, :create, :show] do
        get "conversations", to: "users#conversations"
        get "messages", to: "users#messages"
      end
      resources :conversations, only: [:index, :create, :show] do
        get "users", to: "conversations#users"
        put "admit_user/:user_id", to: "conversations#admit_user"
        post "messages/create/:user_id", to: "messages#create"
        get "messages", to: "conversation#messages"
      end

    end
  end
end
