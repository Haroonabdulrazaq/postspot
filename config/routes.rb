Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'categories#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :categories

  resources :articles do
    resources :comments
    member do
      get 'votes'
      get 'downvote'
    end
  end

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
end
