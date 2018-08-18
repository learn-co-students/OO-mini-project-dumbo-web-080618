class Recipe

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  # Recipe.all should return all of the recipe instances
  def self.all
    @@all
  end

  #add_ingredients should take an array of ingredient instances as an argument,
  #and associate each of those ingredients with this recipe

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  #find recipecard
  def my_recipecard
    RecipeCard.all.select { |r| r.recipe == self }
  end

  # Recipe.most_popular should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
  def self.most_popular
    self.all.max_by { |r| r.my_recipecard.count}
  end


  #users should return the user instances who have recipe cards with this recipe
  def users
    self.my_recipecard.map { |u| u.user }
  end

  #find RecipeIngredient
  def my_recipeing
    RecipeIngredient.all.select { |r| r.recipe == self}
  end

  #ingredients should return all of the ingredients in this recipe
  def ingredients
    self.my_recipeing.map { |i| i.ingredient }
  end

  #allergens should return all of the ingredients in this recipe that are allergens
  def allergens
    found_allergens = Allergen.all.map { |i| i.ingredient }
    found_allergens.select {|a| self.ingredients.include?(a) }.uniq
  end

end
