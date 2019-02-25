# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
puts 'cleaning database...'
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# open url we want to extract information from
information = open(url).read
# parse information and check in consile what the info looks like
# this information is a hash
 ingredients = JSON.parse(information)
# extract information by iterating over the hash key which is "drinks" in this
# case
ingredients["drinks"].each do |ingredient|
# then inside the hash look at the key so we can get the value of the ingredient
# name
  ingredient["strIngredient1"]
# create the ingredient for the database using following syntax
  Ingredient.create(name: ingredient["strIngredient1"])
end
Cocktail.create(name: "Gin Tonic")
Cocktail.create(name: "Pina colada")
Cocktail.create(name: "Margherita")
Cocktail.create(name: "Margherita")
Cocktail.create(name: "Angela's Delight")
Cocktail.create(name: "Sex on the Beach")
Cocktail.all.each do |cocktail|
  5.times do
    dose = Dose.create(description: "2cl", ingredient: Ingredient.offset(rand(Ingredient.count)).first, cocktail: cocktail)
  end
end

# require 'json'
# require 'open-uri'

# Ingredient.destroy_all
# Cocktail.destroy_all
# Dose.destroy_all

# Cocktail.create(name: "cocktail 1")

# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# user_serialized = open(url).read
# ingredient = JSON.parse(user_serialized)

# Cocktail.each do |cocktail|
#   5.times do
#     dose = Dose.create(description: "2cl", ingredient: Ingredients.offset(rand(Ingredients.count)).first, cocktail: cocktail)
#   end
# end

# ingredient['drinks'].each do |ingred|
#   Ingredient.create(name: ingred)
# end
