Pinas::Application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  root "static_pages#home"
  match "/about",   to: "static_pages#about",   via: :get
  match "/signup",  to: "users#new",            via: :get
  match "/signin",  to: "sessions#new",         via: :get
  match "/signout", to: "sessions#destroy",     via: :delete

  match "/music",   to: "music#index",          via: :get
end
