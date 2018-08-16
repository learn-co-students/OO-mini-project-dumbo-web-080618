class User
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @allergen = []
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select {|cards| cards.user == self}
  end

  def add_recipe_card(recipe, date, rating)
    @recipe_cards << RecipeCard.new(recipe, date, rating, self)
  end

  def declare_allergen(ingredient)
    @allergen << Allergen.new(ingredient)
  end

  def allergens
    @allergen
  end

  def top_three_recipes
    recipes.sort_by {|card| card.rating}.reverse[0..2]
  end

  def most_recent_recipe
    recipes[-1].recipe
  end

end
