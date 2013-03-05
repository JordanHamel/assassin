Assassin::Application.routes.draw do
  root :to => "static_pages#home"
  match '/about',    to: 'static_pages#about'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :games do
    member do
      post :generate_user_targets
    end
  end
  resources :player_games, only: [:new, :create, :destroy]
  resources :users, only: [:show]    
end
