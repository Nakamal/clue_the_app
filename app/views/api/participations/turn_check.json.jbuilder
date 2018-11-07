json.game_started @participation.game.start_game
json.my_turn @participation.my_turn?
json.participations do 
  json.array! @participations, partial: "participation", as: :participation
end