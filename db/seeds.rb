Player.create!([
  {username: "Dr. Frank-N-Furter", email: nil, password: nil},
  {username: "Mrs. Munchnik", email: nil, password: nil},
  {username: "Judge Doom", email: nil, password: nil},
  {username: "Capt. Doreen Lewis", email: nil, password: nil},
  {username: "David S. Hubbins", email: nil, password: nil},
  {username: "Justin Gregory", email: nil, password: nil},
  {username: "Tina", email: nil, password: nil}
])
Character.create!([
  {name: "Miss Scarlet", color: "Red", image: nil, start_location: "0,16"},
  {name: "Colonel Mustard", color: "Yellow", image: nil, start_location: "7,23"},
  {name: "Mrs. White", color: "White", image: nil, start_location: "24,14"},
  {name: "Mr. Green", color: "Green", image: nil, start_location: "24,9"},
  {name: "Professor Plum", color: "Purple", image: nil, start_location: "5,0"},
  {name: "Mrs. Peacock", color: "Blue", image: nil, start_location: "18,0"},
  {name: "Wadsworth", color: "Black", image: nil, start_location: "0,8"}
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
  {name: "Hall", image: nil, location_x: nil, location_y: nil},
  {name: "Lounge", image: nil, location_x: nil, location_y: nil},
  {name: "Dining Room", image: nil, location_x: nil, location_y: nil},
  {name: "Kitchen", image: nil, location_x: nil, location_y: nil},
  {name: "Ball Room", image: nil, location_x: nil, location_y: nil},
  {name: "Conservatory", image: nil, location_x: nil, location_y: nil},
  {name: "Billiard Room", image: nil, location_x: nil, location_y: nil},
  {name: "Library", image: nil, location_x: nil, location_y: nil},
  {name: "Study", image: nil, location_x: nil, location_y: nil}
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
