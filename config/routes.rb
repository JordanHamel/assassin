Assassin::Application.routes.draw do
  root :to => "static_pages#home"

  match '/about', to: 'static_pages#about'
  match 'users/edit' => redirect('/404.html')

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :games, except: [:index] do
    member do
      get :players_index
      post :generate_user_targets
    end
  end
  resources :player_games, only: [:new, :create, :destroy] do
    member do
      delete :destroy_by_ajax_request
    end
  end
  resources :users, only: [:show] do
    member do
      post :kill_target
    end
  end  
end
