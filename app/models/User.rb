class User
  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all 
    @@all
  end
  # - `User#recipes`-> should return all of the recipes this user has recipe cards for
  # - `User#add_recipe_card`-> should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe

  def declare_allergen (ingredient)
    match = Allergen.all.find{|allergen| (allergen.ingredient == ingredient && allergen.user == self)}
    if (match != nil)
      new_allergen = Allergen.new(self, ingredient)
    end
  end

  def allergens
    Allergen.all.select{|allergen| allergen.user == self}.uniq
  end
  # - `User#top_three_recipes` -> should return the top three highest rated recipes for this user.
  # - `User#most_recent_recipe`-> should return the recipe most recently added to the user's cookbook.
end