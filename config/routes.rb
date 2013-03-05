Assassin::Application.routes.draw do
  root :to => "static_pages#home"
  match '/about',    to: 'static_pages#about'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :games
  resources :users, only: [:show]
  resources :player_games, only: [:new, :create, :destroy]
    
end
