Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :hashtags, only: [:show], param: :name
  resource :session, only: [:new, :create, :destroy]
  resources :questions, except: [:show, :new, :index]
end
