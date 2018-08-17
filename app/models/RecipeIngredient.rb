#RecipeIngredient is the join between an ingredient and a recipe. This is a has-many-through relationship
class RecipeIngredient
  attr_accessor :ingredient, :recipe
  @@all = []

  def self.all
    @@all
  end

  def initialize(ingredient:, recipe:)
    @ingredient = ingredient
    @recipe = recipe
    @@all << self
  end

end
