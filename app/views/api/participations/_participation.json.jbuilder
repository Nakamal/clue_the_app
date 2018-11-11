json.id participation.id
json.game_id participation.game_id
json.current_location participation.current_location
json.current_location_x participation.current_location_x
json.current_location_y participation.current_location_y
json.move_forward true
json.my_turn participation.my_turn?

json.player do 
  json.partial! participation.player, partial: "api/players/player", as: :player
end

json.character do 
  json.partial! participation.character, partial: "api/characters/character", as: :character
end




