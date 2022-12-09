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
flo.update!(coins: 10)

lamia = User.create!(email: "l@l.l", password: "123456", first_name: "lamia", last_name: "b")
lamia.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Lamia.jpg')), filename: "lamia.jpg", content_type: "image/jpg")
lamia.update!(coins: 10)

marjorie = User.create!(email: "m@m.m", password: "123456", first_name: "marjorie", last_name: "m")
marjorie.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/marjo.jpg')), filename: "marjo.jpg", content_type: "image/jpg")
marjorie.update!(coins: 10)

marc_andre = User.create!(email: "ma@ma.ma", password: "123456", first_name: "marc-andré", last_name: "c")
marc_andre.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Marc-andre.jpg')), filename: "Marc-andre.jpg", content_type: "image/jpg")
marc_andre.update!(coins: 10)

john_doe = User.create!(email: "j@j.j", password: "123456", first_name: "john", last_name: "doe")

Usergroup.create!(user: flo, group: le_wagon)
Usergroup.create!(user: marjorie, group: le_wagon)
Usergroup.create!(user: lamia, group: le_wagon)
Usergroup.create!(user: marc_andre, group: le_wagon)

Usergroup.create!(user: john_doe, group: desjardins)

puts 'Create users..'

chili = Lunch.create!(cooking_date: "2022-12-05", title: "chili", user: flo, group: le_wagon, tags: ["Vege"], description: "The Best Classic Chili – This traditional chili recipe is just like mom used to make with ground beef, beans, and a simple homemade blend of chili seasonings. This classic chili is perfect for a weeknight meal because it can be made in minutes. The only thing to chop is an onion.")
chili.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/chili.jpg')), filename: "chili.jpg", content_type: "image/jpg")

lasagna = Lunch.create!(cooking_date: "2022-12-05", title: "lasagna", user: lamia, group: le_wagon, tags: ["Spicy"], description: "Best lasagna ever")
lasagna.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/lasagna.jpg')), filename: "lasagna.jpg", content_type: "image/jpg")

hamburger = Lunch.create!(cooking_date: "2022-12-05", title: "hamburger", user: lamia, group: le_wagon, tags: ["Gluten"],description: "Very good for meat lovers")
hamburger.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Hamburger.jpg')), filename: "Hamburger.jpg", content_type: "image/jpg")

pizza = Lunch.create!(cooking_date: "2022-12-05", title: "pizza", user: marc_andre, group: le_wagon, tags: ["Vegan", "Gluten"], description: "It has been said that pizza makes the world go ‘round, and there definitely isn’t a shortage of choices when you are craving a slice. Sometimes, you don’t want to hit up a boutique pizzeria, nationwide delivery chain, or the dreaded frozen food aisle, so you elect to make your pizza from scratch. While it may seem like an overwhelming undertaking, homemade pizza is actually a deceptively simple process. The crowning achievement of any homemade ‘za is, of course, the sauce. Before you decide to cut corners by buying a jar, consider making the sauce from scratch as well. Just make sure you add this secret ingredient to guarantee a complex and flavorful homemade pizza.")
pizza.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/pizza.jpg')), filename: "pizza.jpg", content_type: "image/jpg")


puts 'Create lunches..'
