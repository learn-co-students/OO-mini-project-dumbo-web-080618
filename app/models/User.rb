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

  def recipe_cards
    RecipeCard.all.select{|r_card| r_card.user == self}
  end

  def recipes
    recipe_cards.map{|r_card| r_card.recipe}
  end

  def add_recipe_card(recipe, rating, date = Time.now.to_s.split(/[[:punct:]]/).join.split(' ').join.to_i)
    RecipeCard.new(self, recipe, rating, date)
  end
  def declare_allergen (ingredient)
    match = Allergen.all.find{|allergen| (allergen.ingredient == ingredient && allergen.user == self)}
    if (match != nil)
      new_allergen = Allergen.new(self, ingredient)
    end
  end

  def allergens
    Allergen.all.select{|allergen| allergen.user == self}.map{|allergy| allergy.ingredient}.uniq
  end
  # - `User#top_three_recipes` -> should return the top three highest rated recipes for this user.
  def top_three_recipes
    recipe_cards.sort{|card_x,card_y| card_y.rating<=>card_x.rating}.map{|card| card.recipe}[0..2]
  end
  # - `User#most_recent_recipe`-> should return the recipe most recently added to the user's cookbook.
  def most_recent_recipe
    recipe_cards.sort{|card_x,card_y| card_y.date<=>card_x.date}.map{|card| card.recipe}.last
  end
end