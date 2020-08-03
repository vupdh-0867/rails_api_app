namespace :api do
  namespace :v1 do
    get "/home", to: "homes#index"
  end
end
