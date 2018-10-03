Rails.application.routes.draw do
  namespace :api do
    get "/characters" => "characters#index"

    get "/weapons" => "weapons#index"

    get "/rooms" => "rooms#index"
  end
end
