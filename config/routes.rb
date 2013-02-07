Assassin::Application.routes.draw do
  resources :players
  resources :games

  root :to => "static_pages#home"
end
