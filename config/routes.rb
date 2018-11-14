Rails.application.routes.draw do
  namespace :api do
    get "/characters" => "characters#index"
    get "/characters/:id" => "characters#show"

    get "/weapons" => "weapons#index"
    get "/weapons/:id" => "weapons#show"

    get "/rooms" => "rooms#index"
    get "/rooms/:id" => "rooms#show"

    post "/games" => "games#create"
    get "/games/:id" => "games#show"

    patch "/games/:id/start" => "games#start_game"
    get "/games/:id/classifieds" => "games#classified"

    get "/games/:game_id/participations" => "participations#index"
    post "/games/:game_id/participations" => "participations#create"
    get "/participations/:id/turn_check" => "participations#turn_check" 
    patch "/participations/:id/turn" => "participations#take_turn" 
    post "/participations/:id/next_turn_loser" => 'participations#next_turn_loser'

    get "/participations/:id/sheet" => "participations#sheet"

    get "/players" => "players#index"
  end
end
