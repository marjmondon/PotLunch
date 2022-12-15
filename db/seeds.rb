puts 'Clear DB..'
Notification.destroy_all
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

marjorie = User.create!(email: "m@m.m", password: "123456", first_name: "marjorie", last_name: "m")
marjorie.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/marjo.jpg')), filename: "marjo.jpg", content_type: "image/jpg")

flo = User.create!(email: "f@f.f", password: "123456", first_name: "flo", last_name: "g")
flo.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/flo.jpg')), filename: "flo.jpg", content_type: "image/jpg")
flo.update!(coins: 100)

lamia = User.create!(email: "l@l.l", password: "123456", first_name: "lamia", last_name: "b")
lamia.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Lamia.jpg')), filename: "lamia.jpg", content_type: "image/jpg")
lamia.update!(coins: 100)

marc_andre = User.create!(email: "ma@ma.ma", password: "123456", first_name: "marc-andré", last_name: "c")
marc_andre.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Marc-andre.jpg')), filename: "Marc-andre.jpg", content_type: "image/jpg")
marc_andre.update!(coins: 100)

elon = User.create!(email: "e@e.e", password: "123456", first_name: "Elon", last_name: "M")
elon.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Elon.jpg')), filename: "Elon.jpg", content_type: "image/jpg")
elon.update!(coins: 100)

walter = User.create!(email: "w@w.w", password: "123456", first_name: "Walter", last_name: "W")
walter.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/walter.png')), filename: "walter.png", content_type: "image/png")
walter.update!(coins: 100)

ricardo = User.create!(email: "r@r.r", password: "123456", first_name: "Ricardo", last_name: "L")
ricardo.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/ricardo.jpg')), filename: "ricardo.jpg", content_type: "image/jpg")
ricardo.update!(coins: 100)

john_doe = User.create!(email: "j@j.j", password: "123456", first_name: "john", last_name: "doe")

Usergroup.create!(user: flo, group: le_wagon)
Usergroup.create!(user: marjorie, group: le_wagon)
Usergroup.create!(user: lamia, group: le_wagon)
Usergroup.create!(user: marc_andre, group: le_wagon)
Usergroup.create!(user: elon, group: le_wagon)
Usergroup.create!(user: walter, group: le_wagon)
Usergroup.create!(user: ricardo, group: le_wagon)

Usergroup.create!(user: john_doe, group: desjardins)

puts 'Create users..'

chili = Lunch.create!(cooking_date: "2022-12-08", title: "The Best Classic Chili", user: flo, group: le_wagon, tags: ["Spicy", "Vegan"], description: "This traditional chili recipe is just like mom used to make with soy protein, beans, and a simple homemade blend of chili seasonings. Our friends couldn't come last night so we have way too much for us two! Even if it's good, I rather eat something else as a lunch.")
chili.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/chili.jpg')), filename: "chili.jpg", content_type: "image/jpg")

lasagna = Lunch.create!(cooking_date: "2022-12-08", title: "My mom's lasagna", user: lamia, group: le_wagon, tags: ["Vegetarian", "Spicy"], description: "This is my mom's recipe. Just made a bunch of it (way too much! I'm telling you, just the best lasagna you'll ever get. Extra tomato sauce, amazing vegetables, 3 differents cheese.")
lasagna.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/lasagna.jpg')), filename: "lasagna.jpg", content_type: "image/jpg")

hamburger = Lunch.create!(cooking_date: "2022-12-08", title: "Classic hamburger", user: lamia, group: le_wagon, tags: ["Nuts Free"],description: "Very good for meat lovers! Stuffed with onions, topping it with ooey, gooey cheese, crispy bacon, and tangy BBQ sauce. This plain ol' beef patty between 2 slabs of bread will make any meat lover's heart skip a beat.")
hamburger.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Hamburger.jpg')), filename: "Hamburger.jpg", content_type: "image/jpg")

pizza = Lunch.create!(cooking_date: "2022-12-08", title: "Pizza", user: marc_andre, group: le_wagon, tags: ["Vegan"], description: "The BEST vegan pizza made with a garlic-herb crust, simple tomato sauce, TONS of basil and cheese. I topped it with spicy olive oil. Thin crust, tons of flavor, and ridiculously satisfying.", recipe_url: "https://www.loveandlemons.com/vegan-pizza/")
pizza.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/pizza.jpg')), filename: "pizza.jpg", content_type: "image/jpg")

risotto = Lunch.create!(cooking_date: "2022-12-08", title: "Bluebird's Risotto", user: elon, group: le_wagon, tags: ["Vegan"], description: "Go on Twitter to see description.", recipe_url: "https://twitter.com/")
risotto.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/risotto.jpg')), filename: "risotto.jpg", content_type: "image/jpg")

croque = Lunch.create!(cooking_date: "2022-12-08", title: "Albuquerque's Croque Mr", user: walter, group: le_wagon, tags: ["Vegetarian", "Seafood"], description: "Particularly fresh cheeses and good quality of blue meth! I added spinash, onions, mushrooms, shrimp and LOVE!")
croque.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/croque.jpg')), filename: "croque.jpg", content_type: "image/jpg")

salmon = Lunch.create!(cooking_date: "2022-12-08", title: "Best smoked salmon", user: walter, group: le_wagon, tags: ["Gluten Free", "Seafood"], description: "Perfectly smoked salmon is one of those simple exquisite indulgences that is so satisfying. Salmon and smoke are just meant for each other. While the process is both a science and an art, it's really so much easier to make at home than you might think.", recipe_url: "https://www.eatthis.com/grilled-salmon-chermoula-chickpeas-recipe/")
salmon.photos.attach(io: File.open(File.join(Rails.root, 'app/assets/images/salmonchickpeas.png')), filename: "salmonchickpeas.png", content_type: "image/png")

puts 'Create lunches..'
