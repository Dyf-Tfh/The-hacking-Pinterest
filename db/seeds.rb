# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do |index|
  User.create(name: Faker::Name.name)
  # les pins sont reliés aux user
  Pin.create(
    url: Faker::Internet.url('example.com'),
    user_id: index
  )
  # crée 2 commentaires sur 2 pin choisi aléatoirement
  2.times do
    Comment.create(
      pin_id: index,
      user_id: User.order("RANDOM()").first.id,
      content: Faker::DumbAndDumber.quote
    )
  end
end
