# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

carcafe = Company.create!(name: "Carcafe")
lavazza = Company.create!(name: "Lavazza")

puts "Companies has been created."

user_1 = carcafe.users.create!(email: "jose@carcafe.com", password: "123456", password_confirmation: "123456")
user_2 = carcafe.users.create!(email: "andrea@carcafe.com", password: "123456", password_confirmation: "123456")
user_3 = lavazza.users.create!(email: "pedro@lavazza.com", password: "123456", password_confirmation: "123456")

puts "Users has been create."

for i in 1..2
  zone = Zone.create!(
    company: carcafe,
    name: "Zone #{i}"
  )

  Farm.create!(
    zone: zone,
    name: "Finca #{i}",
    code: "CODE XXX",
    latitude: "-75.9867",
    longitude: "4.644467",
    country: "Colombia",
    state: "Huila",
    city: "Iquira",
    address: "Vereda #{i}"
  )
end

for i in 1..2
  zone = Zone.create!(
    company: lavazza,
    name: "Zone #{i}"
  )

  Farm.create!(
    zone: zone,
    name: "Finca #{i}",
    code: "CODE XXX",
    latitude: "-75.9867",
    longitude: "4.644467",
    country: "Colombia",
    state: "Huila",
    city: "Iquira",
    address: "Vereda #{i}"
  )
end

puts "Zones and farms has been created."
