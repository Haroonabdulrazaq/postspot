Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#new'

  resources :users
  resources :sessions
  resources :categories

  resources :articles do
    member do
      get 'votes'
    end
  end

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
end
