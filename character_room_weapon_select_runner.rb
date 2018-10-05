require 'http'


def character_select(character)
  puts
  puts character["name"]
  puts "Piece Color: #{character["color"]}"
  puts
  puts "***************************************"
end

def available_characters(character_array)
  character_array.each do |character_hash|
    character_select(character_hash)
    puts
  end
end

def room_select(room)
  puts
  puts room["name"]
  puts
  puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
end

def available_rooms(rooms_array)
  rooms_array.each do |room_hash|
    room_select(room_hash)
    puts
  end
end

def weapon_select(weapon)
  puts
  puts weapon["name"]
  puts
  puts "========================================="
end

def available_weapons(weapons_array)
  weapons_array.each do |weapon_hash|
    weapon_select(weapon_hash)
    puts
  end
end

def accusation(info)
  puts
  p "I think it was #{info[:character]} with the #{info[:weapon]} in the #{info[:room]}."
  puts
end
  
system "clear"

puts
puts "Welcome to Clue the App!"
puts

while true
  puts "Would you like to..."
  puts "   [1] View available_characters"
  puts "   [2] Pick a character"
  puts "   [3] See possible murder spots"
  puts "   [4] Pick where you think the murder happened"
  puts "   [5] Look at what they could have used"
  puts "   [6] What you think they commited the murder with"
  puts
  puts "   [7] Make your accusation"
  puts
  puts "   [quit] Stop"

  choice = gets.chomp

  if choice == "1"
    response = HTTP.get("http://localhost:3000/api/characters")
    p response.parse
    available_characters(response.parse)
  elsif choice == "2"
    print "What is the id of the character you want to pick: "
    character_id = gets.chomp
    response = HTTP.get("http://localhost:3000/api/characters/#{character_id}")
    character_select(response.parse)
  elsif choice == "3"
    response = HTTP.get("http://localhost:3000/api/rooms")
    p response.parse
    available_rooms(response.parse)
  elsif choice == "4"
    print "Where do you think the murder happened?: "
    room_id = gets.chomp
    response = HTTP.get("http://localhost:3000/api/rooms/#{room_id}")
    room_select(response.parse)
  elsif choice == "5"
    response = HTTP.get("http://localhost:3000/api/weapons")
    p response.parse
    available_weapons(response.parse)
  elsif choice == "6"
    print "How do think they did it?: "
    weapon_id = gets.chomp
    response = HTTP.get("http://localhost:3000/api/weapons/#{weapon_id}")
    weapon_select(response.parse)
  elsif choice == "7"

    character_response = HTTP.get("http://localhost:3000/api/characters")
    puts 
    puts "Characters"
    puts "-" * 30
    character_response.parse.each do |character_hash|
      puts "#{character_hash["id"]} - #{character_hash["name"]}"
    end
    puts 
    print "Which character id?: "
    character_id = gets.chomp.to_i

    weapons_response = HTTP.get("http://localhost:3000/api/weapons")
    puts
    puts "Weapons"
    puts "-" * 30
    weapons_response.parse.each do |weapons_hash|
      puts "#{weapons_hash["id"]} - #{weapons_hash["name"]}"
    end
    puts 
    print "Which room id?"
    weapon_id = gets.chomp.to_i

    rooms_response = HTTP.get("http://localhost:3000/api/rooms")
    puts
    puts "Rooms"
    puts "-" * 30
    rooms_response.parse.each do |rooms_hash|
      puts "#{rooms_hash["id"]} - #{rooms_hash["name"]}"
    end
    puts 
    print "Which room id?"
    room_id = gets.chomp.to_i

    characters = character_response.parse.map {|character_hash| [character_hash["id"], character_hash["name"]] }.to_h
    weapons = weapons_response.parse.map {|weapon_hash| [weapon_hash["id"], weapon_hash["name"]] }.to_h
    rooms = rooms_response.parse.map {|room_hash| [room_hash["id"], room_hash["name"]] }.to_h
    puts
    accusation(character: characters[character_id], room: rooms[room_id], weapon: weapons[weapon_id])
  elsif choice == "quit"
    exit
  end
      
  puts "press enter to continue"
  gets
  system "clear"
end