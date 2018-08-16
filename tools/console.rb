require_relative '../config/environment.rb'
potato = Ingredient.new("potato")
milk = Ingredient.new("milk")
salt = Ingredient.new("salt")
pepper = Ingredient.new("pepper")
ham = Ingredient.new("ham")
lettuce = Ingredient.new("lettuce")
egg = Ingredient.new("egg")
bread = Ingredient.new("bread")
peanut = Ingredient.new("peanut")

mash_potato = Recipe.new("mash potato")
potato_soup = Recipe.new("potato soup")
ham_sandwhich = Recipe.new("ham_sandwhich")
boiled_egg = Recipe.new("boiled egg")

felix = User.new("Felix")
some_guy = User.new("some guy")

felix.add_recipe_card(mash_potato, '1993/9/14', 5)
felix.add_recipe_card(ham_sandwhich, '2018/3/1', 2)
felix.add_recipe_card(potato_soup, '2018/7/14', 4)

some_guy.add_recipe_card(boiled_egg, '1993/9/14',4)
some_guy.add_recipe_card(mash_potato, '1993/9/12',2)

some_guy.declare_allergen(milk)
felix.declare_allergen(milk)
some_guy.declare_allergen(peanut)

mash_potato.add_ingredients([potato, salt, pepper])
potato_soup.add_ingredients([potato, salt, pepper, milk])
ham_sandwhich.add_ingredients([bread, lettuce, ham])
boiled_egg.add_ingredients([egg])

binding.pry
