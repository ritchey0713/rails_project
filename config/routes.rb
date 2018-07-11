Rails.application.routes.draw do

  root 'welcome#home'

  resources :users, only:[:new, :create, :show, :update] do
    resources :games
  end

  resources :rankings, only:[:new]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#create'

  get "/score" => "games#score"



end
