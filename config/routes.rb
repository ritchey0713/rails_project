Rails.application.routes.draw do

  root 'welcome#home'

  resources :users, only:[:new, :create, :show] do
    resources :games
  end

  resources :rankings, only:[:new]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

end
