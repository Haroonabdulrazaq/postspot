Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :users
  resources :sessions
  resources :articles
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
end
