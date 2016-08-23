# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# NUMBER_OF = 1000

# NUMBER_OF.times do
  # Product.create({title: Faker::Pokemon.name, description: Faker::Pokemon.name, price: rand(50)})
# end

6.times do
  Category.create({name: Faker::Pokemon.name})
end

# puts Cowsay.say "Created #{NUMBER_OF} records!"
