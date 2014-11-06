# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Truck.create!([
  {
    name: 'Johnny Blonde',
    cuisine_type: 'Tapas',
    image_file_name: 'jonny_blonde.png'
  },
  {
    name: 'Gorilla Cheese',
    cuisine_type: 'Primate Dinner',
    image_file_name:, 'gorilla_cheese.png'
  },
  {
    name: "Jimbo's Fish Emporium",
    cuisine_type: 'Fish'
  }
])