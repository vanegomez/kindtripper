Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', as: :login, to: 'sessions#new'
  get '/auth/twitter', as: :login_tweet
  get '/auth/twitter/callback', to: 'sessions#create'
  delete '/logout',             to: 'sessions#destroy'

  resources :openings, only: [:index, :show]
  resources :users, only: [:show]
end
