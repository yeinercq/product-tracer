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

for i in 1..4
  zone = Zone.create!(
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
