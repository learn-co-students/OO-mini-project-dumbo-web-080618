class RecipeIngredient

  @@all = []
  # RecipeIngredient is the join between an ingredient and a recipe.  This is a has-many-through relationship

  attr_reader :recipe, :ingredient


  def initialize (recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end
  # - `RecipeIngredient.all` -> should return all of the RecipeIngredient instances
  def self.all 
    @@all 
  end
  # - `RecipeIngredient#recipe`
  # should return the recipe instance
  # def recipe
  #   self.recipe
  # end
end
