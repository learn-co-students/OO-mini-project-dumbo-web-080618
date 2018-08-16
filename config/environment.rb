require 'bundler/setup'
require 'pry'
Bundler.require
require_all 'app'

broccoli = Ingredient.new("broccoli")
cabbage = Ingredient.new("cabbage")
brussels_sprouts = Ingredient.new("brussels sprouts")
butter = Ingredient.new("butter")
chicken_liver = Ingredient.new("chicken liver")

apple_pie = Recipe.new("apple pie", [broccoli, brussels_sprouts, butter])
chicken_pot_pie = Recipe.new("chicken pot pie", [cabbage, chicken_liver])
brownie = Recipe.new("brownie", [butter, brussels_sprouts])
rice_pilaf = Recipe.new("rice pilaf", [brussels_sprouts, butter])
steak = Recipe.new("steak", [brussels_sprouts, chicken_liver])

eben = User.new("eben")
danny = User.new("danny")
chris = User.new("chris")
gina = User.new("gina")

eben_apple = RecipeCard.new(apple_pie, "8/14", 4, eben)

eben_brownie = RecipeCard.new(brownie, "8/14", 4, eben)
gina_brownie = RecipeCard.new(brownie, "8/14", 2, gina)
gina_chicken = RecipeCard.new(chicken_pot_pie, "8/14", 8, gina)
danny_chicken = RecipeCard.new(chicken_pot_pie, "8/14", 4, danny)
chris_brownie = RecipeCard.new(brownie, "8/14", 1, chris)
gina_rice_pilaf = RecipeCard.new(rice_pilaf, "8/15", 5, gina)
gina_steak = RecipeCard.new(steak, "3/7", 9, gina)

gina.declare_allergen(broccoli)
eben.declare_allergen(broccoli)
eben.declare_allergen(brussels_sprouts)
chris.declare_allergen(broccoli)
chris.declare_allergen(cabbage)
chris.declare_allergen(butter)
danny.declare_allergen(chicken_liver)






binding.pry
