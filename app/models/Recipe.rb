class Recipe
  @@all = []

  attr_reader :name
  def initialize (name)
    @name = name
    @@all << self
  end

  # - `Recipe.all`-> should return all of the recipe instances
  def self.all 
    @@all
  end

  # helper method that provides the select recipe_ingredients for instance of class
  def recipe_ingredients
    RecipeIngredient.all.select{|rec_ingredient|
      self == rec_ingredient.recipe}
  end
  # - `Recipe#ingredients`
  # should return all of the ingredients in this recipe
  def get_ingredients
    recipe_ingredients.map{|rec_ingredient| rec_ingredient.ingredient}.uniq
  end

  # - `Recipe#add_ingredients`
  # should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
  def add_ingredients(ingredients_array)
    ingredients_array.each{|ingredient|
      RecipeIngredient.new(self, ingredient)}
  end

# TODO: Once Allergen class is made/can initialize do this:
# - `Recipe#allergens`
# should return all of the ingredients in this recipe that are allergens
  def allergens
  end

# TODO: Once the User Class is made do the following
=begin
# - `Recipe.most_popular` -> should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
  def self.most_popular
  end
  # - `Recipe#users` ->should return the user instances who have recipe cards with this recipe
  def users
  end
=end
end
