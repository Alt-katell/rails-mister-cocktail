# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require "open-uri"

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")


url_ingredients = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

serialized_ingredients = open(url_ingredients).read
drinks = JSON.parse(serialized_ingredients)

ingredients = drinks["drinks"]

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

mint_julep = Cocktail.create(name: "Mint Julep")
whiskey_sour = Cocktail.create(name: "Whiskey Sour")
mojito = Cocktail.create(name: "Mojito")


Dose.create(description: '1/3 cup',
            cocktail: mojito,
            ingredient: Ingredient.where(name: 'Sugar').first)

Dose.create(description: '1/3 cup',
            cocktail: mojito,
            ingredient: Ingredient.where(name: 'Light rum').first)

Dose.create(description: '1/3 cup',
            cocktail: whiskey_sour,
            ingredient: Ingredient.where(name: 'Apricot brandy').first)

Dose.create(description: '1/3 cup',
            cocktail: whiskey_sour,
            ingredient: Ingredient.where(name: 'Triple sec').first)

Dose.create(description: '1/3 cup',
            cocktail: mint_julep,
            ingredient: Ingredient.where(name: 'Bourbon').first)

Dose.create(description: '1/3 cup',
            cocktail: mint_julep,
            ingredient: Ingredient.where(name: 'Grenadine').first)
