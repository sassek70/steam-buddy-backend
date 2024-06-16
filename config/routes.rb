Rails.application.routes.draw do
  # get 'user/username'
  # get 'user/email'
  # resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get `/userdata`, to: 'steam#test_query'
  get "/user_index", to: "users#index"
  get "/steam", to: "steam#index"
  get "/steam_user", to: "steam#test_query"
  get "/env", to: "steam#env_test"
  get "/getuser", to: "users#show"


  post "/create_user", to: "users#create"

  patch "/update_user/:id", to: "users#update"



  delete "/delete_user/:id", to: "users#destroy"
  delete "/delete_all", to: "users#delete_all_users"

end
