require 'http'


def character_select(character)
  puts "**************************************"
  puts
  puts character["name"]
  puts "Piece Color: #{character["color"]}"
  puts
  puts "***************************************"
  puts
end

def available_characters(character_array)
  character_array.each do |character_hash|
    character_select(character_hash)
    puts
  end
end

def room_select(room)
  puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  puts
  puts room["name"]
  puts
  puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  puts
end

def available_rooms(rooms_array)
  rooms_array.each do |room_hash|
    room_select(room_hash)
    puts
  end
end


  
system "clear"

puts "Welcome to Clue the App!"
puts

while true
  puts "Would you like to..."
  puts "   [1] View available_characters"
  puts "   [2] Pick a character"
  puts "   [3] See possible murder spots"
  puts "   [4] Pick where you think the murder happened"
  puts "   [quit] Stop"
  puts

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
  elsif choice == "quit"
    exit
  end
      
  puts "press enter to continue"
  gets
  system "clear"
end