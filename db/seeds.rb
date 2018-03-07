# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts "Importing countries..."
CSV.foreach(Rails.root.join("db/csv/countries.csv"), headers: true) do |row|
  Country.create! do |country|
    country.id = row[0]
    country.name = row[2]
  end
end

puts "Importing states..."
CSV.foreach(Rails.root.join("db/csv/states.csv"), headers: true) do |row|
  State.create! do |state|
    state.name = row[1]
    state.country_id = row[2]
  end
end

puts "Importing cities..."
CSV.foreach(Rails.root.join("db/csv/cities.csv"), headers: true) do |row|
  City.create! do |city|
    city.name = row[1]
    city.state_id = row[2]
  end
end

