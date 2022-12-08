# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Clear DB..'

Swap.destroy_all
Message.destroy_all
Lunch.destroy_all
Usergroup.destroy_all
Group.destroy_all
User.destroy_all

puts 'Create data...'

le_wagon = Group.create!(name: "Le Wagon")
desjardins = Group.create!(name: "Desjardins")

puts 'Create groups..'

flo = User.create!(email: "f@f.f", password: "123456", first_name: "flo", last_name: "g")
flo.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/flo.jpg')), filename: "flo.jpg", content_type: "image/jpg")

lamia = User.create!(email: "l@l.l", password: "123456", first_name: "lamia", last_name: "b")
lamia.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Lamia.jpg')), filename: "lamia.jpg", content_type: "image/jpg")

marjorie = User.create!(email: "m@m.m", password: "123456", first_name: "marjorie", last_name: "m")
marjorie.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/marjo.jpg')), filename: "marjo.jpg", content_type: "image/jpg")

marc_andre = User.create!(email: "ma@ma.ma", password: "123456", first_name: "marc-andré", last_name: "c")
marc_andre.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Marc-andre.jpg')), filename: "Marc-andre.jpg", content_type: "image/jpg")


john_doe = User.create!(email: "j@j.j", password: "123456", first_name: "john", last_name: "doe")

Usergroup.create!(user: flo, group: le_wagon)
Usergroup.create!(user: marjorie, group: le_wagon)
Usergroup.create!(user: lamia, group: le_wagon)
Usergroup.create!(user: marc_andre, group: le_wagon)

Usergroup.create!(user: john_doe, group: desjardins)

puts 'Create users..'

chili = Lunch.create!(cooking_date: "2022-12-05", title: "chili", user: flo, group: le_wagon)
chili.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/chili.jpg')), filename: "chili.jpg", content_type: "image/jpg")

lasagna = Lunch.create!(cooking_date: "2022-12-05", title: "lasagna", user: marjorie, group: le_wagon)
lasagna.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/lasagna.jpg')), filename: "lasagna.jpg", content_type: "image/jpg")

hamburger = Lunch.create!(cooking_date: "2022-12-05", title: "hamburger", user: lamia, group: le_wagon)
hamburger.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Hamburger.jpg')), filename: "Hamburger.jpg", content_type: "image/jpg")

pizza = Lunch.create!(cooking_date: "2022-12-05", title: "pizza", user: marc_andre, group: le_wagon)
pizza.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/pizza.jpg')), filename: "pizza.jpg", content_type: "image/jpg")


puts 'Create lunches..'
