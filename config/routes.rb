# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # this is required to map sign out to a get request so the sign out button works
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :exercise_logs, only: [:show] do
    get 'exercise_instances/form', to: 'exercise_instances#form', as: :form
    resources :exercise_instances do
      # Add a nested route for the form
      resources :set_instances
    end
  end

  get '/test', to: 'home#test', as: :test

  resources :exercises

  get 'home/index'
  # root "articles#index"

  # resources :articles do
  #   resources :comments
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'
  get 'home/index'
end
