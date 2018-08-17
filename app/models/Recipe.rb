class Recipe
  attr_accessor :users, :allergens, :description
  @@all = []

  def initialize(description:)
    @@all << self
    @description =  description
  end

  def self.all
    @@all
  end

  def ingredients
    rec_ingredients = RecipeIngredient.all.select {|rec_ingredient| rec_ingredient.recipe == self}
    rec_ingredients.map {|rec_in| rec_in.ingredient}
  end

  def cards
    RecipeCard.all.select {|rec_card| rec_card.recipe == self}
  end

  def allergens
    ingredients.map {|ingredient| ingredient.allergens}.flatten
  end

  def users
    # User.all.select {|user| cards.include?(user)}
    cards.map {|card| card.user}.uniq
  end

  #return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
  def self.most_popular
    Recipe.all.max_by {|recipe| recipe.cards.count}
  end

  #should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
  def add_ingredients(ingredients)
    ingredients.each {|ingredient| RecipeIngredient.new(ingredient: ingredient, recipe: self)}
  end

end
