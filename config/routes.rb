Assassin::Application.routes.draw do
  resources :players
  resources :games
  resource :session, only: [:new, :create, :destroy]
  resources :player_games, only: [:new, :create, :destroy]

  root :to => "static_pages#home"

  match '/about',    to: 'static_pages#about'

  match '/signup', to: 'players#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
end
