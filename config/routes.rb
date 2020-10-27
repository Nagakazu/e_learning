Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships
  # resources :category, only: [:index, :show]
  
  root 'static_pages#home'
  
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'


  resources :users do
    member do
      get :following, :followers
    end
  end
  
  namespace :admin do
   resources :categories do
      resources :words
    end
  end
  
  resources :categories
end