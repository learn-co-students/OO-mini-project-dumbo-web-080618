class Recipe

  @@all = []
  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.select {|recipe_card| recipe_card.recipe == self}
  end

  def users
    recipe_cards.map {|recipe_card| recipe_card.user}
  end

  def self.most_popular
    all.sort_by {|recipe| recipe.recipe_cards.count}.last
  end

  def ingredients
    recipe_ingredients = RecipeIngredient.all.select {|instance| instance.recipe == self}
    recipe_ingredients.map {|instance| instance.ingredient}
  end

  def allergens
    ingredients.select {|ingredient| ingredient.allergens.any?}
  end

  def add_ingredients(new_ingredients)
    new_ingredients.each {|ingredient| RecipeIngredient.new(self,ingredient)}
  end
end
