Rails.application.routes.draw do
  # get 'places/index'
  root 'places#index'


  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  post '/association:place_id' => 'users#association'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
