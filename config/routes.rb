Rails.application.routes.draw do
  get 'user/username'
  get 'user/email'
  resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get `/userdata`, to: 'steam#test_query'
  get "/index", to: "user#index"
  get "/steam", to: "steam#index"
  get "/steam_user", to: "steam#test_query"
  get "/env", to: "steam#env_test"

end
