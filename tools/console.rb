require_relative '../config/environment.rb'

sherzod = User.find(1)
maddie = User.find(2)

chicken_soup = Recipe.find(1)
beef_soup = Recipe.find(2)

chicken = Ingredient.find(1)
water = Ingredient.find(2)

csr1 = RecipeIngredient.find(1)
csr2 = RecipeIngredient.find(2)

maddie_a = Allergen.create(user_id: 2, ingredient_id: 2)


binding.pry
