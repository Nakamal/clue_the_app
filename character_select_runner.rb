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

system "clear"

puts "Welcome to Clue the App!"
puts

while true
  puts "Would you like to..."
  puts "   [1] view available_characters"
  puts "   [2] pick a character"
  puts "   [quit] stop"
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
  elsif choice == "quit"
    exit
  end
      
  puts "press enter to continue"
  gets
  system "clear"
end