Character.create!([
  {name: "Colonel Mustard", color: "Yellow", image: "colonel_mustard_character_piece.png", start_location: "7,23"},
  {name: "Miss Scarlet", color: "Red", image: "miss_scarlet_character_piece.png", start_location: "0,16"},
  {name: "Mrs. White", color: "White", image: "mrs_white_character_piece.png", start_location: "24,14"},
  {name: "Mr. Green", color: "Green", image: "mr_green_character_piece.png", start_location: "24,9"},
  {name: "Professor Plum", color: "Purple", image: "professor_plum_character_piece.png", start_location: "5,0"},
  {name: "Mrs. Peacock", color: "Blue", image: "mrs_peacock_character_piece.png", start_location: "18,0"},
  {name: "Wadsworth", color: "Black", image: "wadsworth_character_piece.png", start_location: "0,8"}
])
Weapon.create!([
  {name: "Knife", image: nil},
  {name: "Candlestick", image: nil},
  {name: "Revolver", image: nil},
  {name: "Rope", image: nil},
  {name: "Lead Pipe", image: nil},
  {name: "Wrench", image: nil}
])
Room.create!([
  {name: "Hall", image: nil, location_x: 2, location_y: 1},
  {name: "Lounge", image: nil, location_x: 18, location_y: 2},
  {name: "Dining Room", image: nil, location_x: 18, location_y: 13},
  {name: "Kitchen", image: nil, location_x: 19, location_y: 22},
  {name: "Ball Room", image: nil, location_x: 11, location_y: 21},
  {name: "Conservatory", image: nil, location_x: 2, location_y: 22},
  {name: "Billiard Room", image: nil, location_x: 1, location_y: 15},
  {name: "Library", image: nil, location_x: 1, location_y: 7},
  {name: "Study", image: nil, location_x: 2, location_y: 1}
])
Card.create!([
  {designatable_type: "Character", designatable_id: 1},
  {designatable_type: "Character", designatable_id: 2},
  {designatable_type: "Character", designatable_id: 3},
  {designatable_type: "Character", designatable_id: 4},
  {designatable_type: "Character", designatable_id: 5},
  {designatable_type: "Character", designatable_id: 6},
  {designatable_type: "Character", designatable_id: 7},
  {designatable_type: "Weapon", designatable_id: 1},
  {designatable_type: "Weapon", designatable_id: 2},
  {designatable_type: "Weapon", designatable_id: 3},
  {designatable_type: "Weapon", designatable_id: 4},
  {designatable_type: "Weapon", designatable_id: 5},
  {designatable_type: "Weapon", designatable_id: 6},
  {designatable_type: "Room", designatable_id: 1},
  {designatable_type: "Room", designatable_id: 2},
  {designatable_type: "Room", designatable_id: 3},
  {designatable_type: "Room", designatable_id: 4},
  {designatable_type: "Room", designatable_id: 5},
  {designatable_type: "Room", designatable_id: 6},
  {designatable_type: "Room", designatable_id: 7},
  {designatable_type: "Room", designatable_id: 8},
  {designatable_type: "Room", designatable_id: 9}
])

Player.create!([
  {username: "Dr. Frank-N-Furter", email: nil, password: nil},
  {username: "Mrs. Munchnik", email: nil, password: nil},
  {username: "Judge Doom", email: nil, password: nil},
  {username: "Capt. Doreen Lewis", email: nil, password: nil},
  {username: "David S. Hubbins", email: nil, password: nil},
  {username: "Justin Gregory", email: nil, password: nil},
  {username: "Tina", email: nil, password: nil}
])
