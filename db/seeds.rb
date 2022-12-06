# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Clear DB..'

Usergroup.destroy_all
Group.destroy_all
User.destroy_all
Lunch.destroy_all

puts 'Create data...'

le_wagon = Group.create!(name: "Le Wagon")
desjardins = Group.create!(name: "Desjardins")

puts 'Create groups..'

flo = User.create!(email: "f@f.f", password: "123456", first_name: "flo", last_name: "g")
lamia = User.create!(email: "l@l.l", password: "123456", first_name: "lamia", last_name: "b")
marjorie = User.create!(email: "m@m.m", password: "123456", first_name: "marjorie", last_name: "m")
marc_andre = User.create!(email: "ma@ma.ma", password: "123456", first_name: "marc-andré", last_name: "c")

john_doe = User.create!(email: "j@j.j", password: "123456", first_name: "john", last_name: "doe")

Usergroup.create!(user: flo, group: le_wagon)
Usergroup.create!(user: marjorie, group: le_wagon)
Usergroup.create!(user: lamia, group: le_wagon)
Usergroup.create!(user: marc_andre, group: le_wagon)

Usergroup.create!(user: john_doe, group: desjardins)

puts 'Create users..'

chili = Lunch.create!(cooking_date: "2022-12-05", title: "chili", user: flo, group: le_wagon)
lasagna = Lunch.create!(cooking_date: "2022-12-05", title: "lasagna", user: marjorie, group: le_wagon)
hamburger = Lunch.create!(cooking_date: "2022-12-05", title: "hamburger", user: lamia, group: le_wagon)
pizza = Lunch.create!(cooking_date: "2022-12-05", title: "pizza", user: marc_andre, group: le_wagon)

puts 'Create lunches..'
