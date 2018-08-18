require_relative '../config/environment.rb'

#user
john = User.new("John")
maria = User.new("Maria")
bob = User.new("Bob")

#Ingredient
tomato = Ingredient.new("Tomato")
cilantro = Ingredient.new("Cilantro")
salt = Ingredient.new("Salt")
pepper = Ingredient.new("Pepper")
chicken = Ingredient.new("Chicken")

#allergen
allergen1 = john.declare_allergen(cilantro)
allergen10 = bob.declare_allergen(cilantro)
allergen3 = bob.declare_allergen(pepper)
allergen2 = maria.declare_allergen(pepper)
allergen4 = john.declare_allergen(pepper)
allergen5 = maria.declare_allergen(tomato)


#recipe
stew = Recipe.new("Stew")
stir_fry = Recipe.new("Srir Fry")
boil = Recipe.new("Boil")
deep_fried = Recipe.new("Deep Fried")

#recipe ingredient
recipeing1 = stew.add_ingredients([tomato, salt, pepper])
recipeing2 = boil.add_ingredients([salt, chicken, tomato])
recipeing3 = deep_fried.add_ingredients([tomato, chicken, salt])
recipeing4 = stir_fry.add_ingredients([chicken, tomato, pepper])

#recipe card
recipecard1 = john.add_recipe_card(boil, "2018/04/03", 8)
recipecard2 = john.add_recipe_card(stew, "2018/07/12", 5)
recipecard3 = john.add_recipe_card(deep_fried, "2018/01/05", 7)
recipecard4 = john.add_recipe_card(stir_fry, "2018/08/09", 4)
recipecard5 = maria.add_recipe_card(stew, "2018/06/18", 3)
recipecard6 = bob.add_recipe_card(stew, "2018/03/29", 4)

binding.pry
0
