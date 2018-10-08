Rails.application.routes.draw do
  namespace :api do
    get "/characters" => "characters#index"
    get "/characters/:id" => "characters#show"

    get "/weapons" => "weapons#index"
    get "/weapons/:id" => "weapons#show"

    get "/rooms" => "rooms#index"
    get "/rooms/:id" => "rooms#show"

    post "/games" => "games#create"

    get '/games/:game_id/participations' => 'participations#index'
    post '/games/:game_id/participations' => 'participations#create'
  end
end
