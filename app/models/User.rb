class User
  attr_accessor :name, :age
  @@all = []

  def self.all
    @@all
  end

  def initialize(name:, age:)
    @name = name
    @age = age
    @@all << self
  end

  #accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
  def add_recipe_card(recipe, date, rating)
    recipe_card = RecipeCard.new(date:date, rating:rating, user:self, recipe:recipe)
    # @recipes << recipe_card
  end

  def allergens
    Allergen.all.select {|allergen| allergen.user == self}
  end

  def cards
    RecipeCard.all.select {|rec_card| rec_card.user == self}
  end

 # should return all of the recipes this user has recipe cards for
  def recipes
    cards.map {|card| card.recipe}.uniq
  end

  #accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
  def declare_allergen(ingredient)
    Allergen.new(user: self, ingredient:ingredient)
  end

  #return the top three highest rated recipes for this user.
  def top_three_recipes
    sorted = cards.sort_by {|card| card.rating}
    top_three = []
    top_three << sorted[sorted.length-1].recipe
    top_three << sorted[sorted.length-2].recipe
    top_three << sorted[sorted.length-3].recipe
    top_three
  end

  #return the recipe most recently added to the user's cookbook.
  def most_recent_recipe
    sorted = cards.sort_by {|card| card.date}
    sorted[sorted.length-1].recipe
  end

  # return all recipes that do not contain ingredients the user is allergic to
  #not going to work
  def safe_recipes
    my_ingredients = allergens.map {|allergen| allergen.ingredient}
    Recipe.all.select do |recipe|
      recipe.ingredients.none? do |ingredient|
        my_ingredients.include?(ingredient)
      end
    end
  end


end
