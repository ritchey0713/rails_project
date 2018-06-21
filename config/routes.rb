Rails.application.routes.draw do

  resources :users do
    resources :games
  end

  resources :rankings, only:[:new]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

end
