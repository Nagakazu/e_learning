Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships
  
  root 'static_pages#home'
  
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'


  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :words, only: [:index, :show]
    namespace :admin do
      resources :words, only: [:index, :new, :create, :show,  :edit, :destroy, :update]
    end

  resources :categories, only: [:index, :show]
    namespace :admin do
      resources :categories, only: [:index, :new, :create, :show,  :edit, :destroy, :update]
    end
  end