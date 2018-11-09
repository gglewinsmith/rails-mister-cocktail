require 'json'
require 'open-uri'
Ingredient.destroy_all
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = open(url).read
ingredients_JSON = JSON.parse(ingredients)

ingredients_JSON["drinks"].each do |ingredient_hash|
  name = ingredient_hash["strIngredient1"]
  Ingredient.create!(name: name)
end

Cocktail.destroy_all
Cocktail.create(name: "Gin and tonic")
Cocktail.create(name: "Margarita")
Cocktail.create(name: "Martini")
Cocktail.create(name: "Vodka")


