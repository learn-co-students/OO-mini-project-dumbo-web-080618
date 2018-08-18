class User

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.select {|recipe_card| recipe_card.user == self}
  end

  def recipes
    recipe_cards.map {|recipe_card| recipe_card.recipe}
  end

  def add_recipe_card(recipe,date,rating)
    RecipeCard.new(recipe,self,date,rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self,ingredient)
  end

  def allergens
    user_allergens = Allergen.all.select {|allergen| allergen.user == self}
    user_allergens.map {|allergen| allergen.ingredient}
  end

  def top_three_recipes
    sorted_recipe_cards = recipe_cards.sort_by {|recipe_card| recipe_card.rating}
    top_three = sorted_recipe_cards[0..2]
    top_three.map {|recipe_card| recipe_card.recipe}
  end

  def most_recent_recipe
    recipe_cards.sort_by {|recipe_card| recipe_card.date}.last.recipe
  end
  

end
