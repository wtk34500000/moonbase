Rails.application.routes.draw do
  # resources :planets
  # resources :moons
  # resources :users

  #home
  get "/home", to: "home#index", as: 'home'

  #sessions
  get "/home/login", to: "sessions#new", as: 'home_login'
  post "/home/login", to: "sessions#create"
  get "/home/logout", to: "sessions#destroy"

  #user routes
  get "/home/users/new", to: "users#new", as: 'new_user'
  post "/home/users", to: "users#create"
  get "/home/users/:id", to: "users#show", as: 'user'

  #planet routes
  get "/home/planets", to: "planets#index", as: 'planets'
  get "/hoome/planets/:id", to: "planets#show", as: 'planet'

  #moon routes
  get "/home/moons", to: "moons#index", as: 'moons'
  get "/home/moon/:id", to: "moons#show", as: 'moon'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
