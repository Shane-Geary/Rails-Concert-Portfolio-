Rails.application.routes.draw do
  root 'sessions#home' 

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy' 

  get '/auth/google_oauth2/callback' => 'sessions#google' 

  resources :users
  resources :venues do 
    resources :tickets, shallow: true y 
  end
  resources :tickets
end 
