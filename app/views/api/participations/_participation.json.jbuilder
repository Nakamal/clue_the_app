json.id participation.id
json.game_id participation.game_id
json.current_location participation.current_location
json.move_forward true
json.my_turn participation.my_turn?

json.player do 
  json.partial! participation.player, partial: "api/players/player", as: :player
end

json.character do 
  json.partial! participation.character, partial: "api/characters/character", as: :character
end




