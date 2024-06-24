Rails.application.routes.draw do
  root "users#home"
  
  get "/users", to: "users#index"
  get "/users/:username", to: "users#show"
  post "/insert_user_record", to: "users#create"
  post "/update_users/:username", to: "users#update"

  get "/venues", to: "venues#index"
  post "/insert_venue_record", to: "venues#create"
  get "/venues/:id", to: "venues#show"
  post "/update_venue/:id", to: "venues#update"
  get "/delete_venue/:id", to: "venues#destroy"
  
  post "/insert_comment_record", to: "comments#create"
end
