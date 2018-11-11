json.game_started @participation.game.start_game
json.my_turn @participation.my_turn?
json.game_completed @participation.game.complete
json.game_status @participation.game_status
json.participations do 
  json.array! @participations, partial: "participation", as: :participation
end