Assassin::Application.routes.draw do
  devise_for :users

  resources :games

  root :to => "static_pages#home"

  match '/about',    to: 'static_pages#about'
end
