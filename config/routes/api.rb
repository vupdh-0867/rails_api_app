namespace :api do
  namespace :v1 do
    get "/home", to: "homes#index"
    mount_devise_token_auth_for "User", at: "auth"
  end
end
