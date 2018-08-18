class User

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  # User.all should return all of the user instances
  def self.all
    @@all
  end

  #add_recipe_card should accept a recipe instance as an argument,
  # as well as a date and rating,
  # and create a new recipe card for this user and the given recipe
  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  #declare_allergen should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  #find the recipecard
  def my_recipecard
    RecipeCard.all.select { |u| u.user == self }
  end

  #recipes should return all of the recipes this user has recipe cards for
  def recipes
    self.my_recipecard.map { |r| r.recipe }
  end

  #allergens should return all of the ingredients this user is allergic to
  def allergens
    found_allergen = Allergen.all.select { |u| u.user == self }
    found_allergen.map { |i| i.ingredient }
  end

  #top_three_recipes should return the top three highest rated recipes for this user.
  def top_three_recipes
    top_3 = []
    found_recipes = self.my_recipecard.sort_by { |r| -r.rating }
    recipes = found_recipes.map { |n| n.recipe }
    i = 0
    until top_3.count == 3
      top_3 << recipes[i]
      i+=1
    end
    top_3
  end

  #most_recent_recipe should return the recipe most recently added to the user's cookbook.
  def most_recent_recipe
    find_date = self.my_recipecard.sort_by { |d| Date.parse(d.date) }.last
    find_date.recipe
  end

  ######BONUS######
  #safe_recipes should return all recipes that do not contain ingredients the user is allergic to
  def safe_recipes
    self.recipes.select do |r|
      !(r.ingredients & self.allergens).any?
    end
  end

end
