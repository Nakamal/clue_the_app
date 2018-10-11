json.id @game.id
json.available_characters do 
 json.array! @game.available_characters, partial: "api/characters/character", as: :character
end