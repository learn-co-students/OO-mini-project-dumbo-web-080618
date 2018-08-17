class Ingredient
  @@all = []
  attr_accessor :name

  def self.all
    @@all
  end

  def initialize(name:)
    @name = name
    @@all << self
  end

  #return the ingredient instance that the highest number of users are allergic to
  def self.most_common_allergen
    Ingredient.all.max_by {|ingredient| ingredient.allergens.count}
    # Allergen.all.max_by {|allergen| allergen.count}.ingredient
  end

  def allergens
    Allergen.all.select {|allergen| allergen.ingredient == self}
  end

  def recipe_ingredients
    RecipeIngredient.all.select {|rec_in| rec_in.ingredient == self}
  end

  def recipes
    recipe_ingredients.map {|rec_in| rec_in.recipe}.uniq
  end
end
