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
flo.update!(coins: 100)

lamia = User.create!(email: "l@l.l", password: "123456", first_name: "lamia", last_name: "b")
lamia.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Lamia.jpg')), filename: "lamia.jpg", content_type: "image/jpg")
lamia.update!(coins: 100)

marjorie = User.create!(email: "m@m.m", password: "123456", first_name: "marjorie", last_name: "m")
marjorie.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/marjo.jpg')), filename: "marjo.jpg", content_type: "image/jpg")


marc_andre = User.create!(email: "ma@ma.ma", password: "123456", first_name: "marc-andré", last_name: "c")
marc_andre.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Marc-andre.jpg')), filename: "Marc-andre.jpg", content_type: "image/jpg")
marc_andre.update!(coins: 100)

john_doe = User.create!(email: "j@j.j", password: "123456", first_name: "john", last_name: "doe")

Usergroup.create!(user: flo, group: le_wagon)
Usergroup.create!(user: marjorie, group: le_wagon)
Usergroup.create!(user: lamia, group: le_wagon)
Usergroup.create!(user: marc_andre, group: le_wagon)

Usergroup.create!(user: john_doe, group: desjardins)

puts 'Create users..'

chili = Lunch.create!(cooking_date: "2022-12-08", title: "The Best Classic Chili", user: flo, group: le_wagon, tags: ["Vegtarian", "Spicy"], description: "This traditional chili recipe is just like mom used to make with ground beef, beans, and a simple homemade blend of chili seasonings. Our friends couldn't come last night so we have way too much for us two! Even if it's good, I rather eat something else as a lunch.")
chili.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/chili.jpg')), filename: "chili.jpg", content_type: "image/jpg")

lasagna = Lunch.create!(cooking_date: "2022-12-08", title: "My mom's lasagna", user: lamia, group: le_wagon, tags: ["Vegan", "Spicy"], description: "This is my mom's recipe. Just made a bunch of it (way too much! I'm telling you, just the best lasagna you'll ever get. Extra meat sauce, 3 differents cheese.")
lasagna.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/lasagna.jpg')), filename: "lasagna.jpg", content_type: "image/jpg")

hamburger = Lunch.create!(cooking_date: "2022-12-08", title: "Classic hamburger", user: lamia, group: le_wagon, tags: ["Gluten Free"],description: "Very good for meat lovers! Stuffed with onions, topping it with ooey, gooey cheese, crispy bacon, and tangy BBQ sauce. This plain ol' beef patty between 2 slabs of bread will make any meat lover's heart skip a beat.")
hamburger.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Hamburger.jpg')), filename: "Hamburger.jpg", content_type: "image/jpg")

pizza = Lunch.create!(cooking_date: "2022-12-08", title: "Pizza", user: marc_andre, group: le_wagon, tags: ["Vegan", "Gluten Free"], description: "The BEST vegan pizza made with a garlic-herb crust, simple tomato sauce, TONS of basil and cheese. I topped it with spicy olive oil. Thin crust, tons of flavor, and ridiculously satisfying.")
pizza.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/pizza.jpg')), filename: "pizza.jpg", content_type: "image/jpg")

chili2 = Lunch.create!(cooking_date: "2022-12-08", title: "The Best Classic Chili 2", user: flo, group: le_wagon, tags: ["Vegtarian", "Spicy"], description: "This traditional chili recipe is just like mom used to make with ground beef, beans, and a simple homemade blend of chili seasonings. Our friends couldn't come last night so we have way too much for us two! Even if it's good, I rather eat something else as a lunch.")
chili2.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/chili.jpg')), filename: "chili.jpg", content_type: "image/jpg")

lasagna2 = Lunch.create!(cooking_date: "2022-12-08", title: "My mom's lasagna 2", user: lamia, group: le_wagon, tags: ["Vegan", "Spicy"], description: "This is my mom's recipe. Just made a bunch of it (way too much! I'm telling you, just the best lasagna you'll ever get. Extra meat sauce, 3 differents cheese.")
lasagna2.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/lasagna.jpg')), filename: "lasagna.jpg", content_type: "image/jpg")

hamburger2 = Lunch.create!(cooking_date: "2022-12-08", title: "Classic hamburger 2", user: lamia, group: le_wagon, tags: ["Gluten Free"],description: "Very good for meat lovers! Stuffed with onions, topping it with ooey, gooey cheese, crispy bacon, and tangy BBQ sauce. This plain ol' beef patty between 2 slabs of bread will make any meat lover's heart skip a beat.")
hamburger2.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Hamburger.jpg')), filename: "Hamburger.jpg", content_type: "image/jpg")

pizza2 = Lunch.create!(cooking_date: "2022-12-08", title: "Pizza 2", user: marc_andre, group: le_wagon, tags: ["Vegan", "Gluten Free"], description: "The BEST vegan pizza made with a garlic-herb crust, simple tomato sauce, TONS of basil and cheese. I topped it with spicy olive oil. Thin crust, tons of flavor, and ridiculously satisfying.")
pizza2.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/pizza.jpg')), filename: "pizza.jpg", content_type: "image/jpg")
puts 'Create lunches..'
