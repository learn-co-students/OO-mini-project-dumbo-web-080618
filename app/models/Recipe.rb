class Recipe

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    most_common = 0
    returned_recipe = nil
    self.all.each do |i|
      if most_common < self.recipe_count(i)
        most_common = self.recipe_count(i)
        returned_recipe = i
      end
    end
    returned_recipe
  end

  def self.recipe_count(x)
    RecipeCard.all.select {|e| e.recipe == x}.length
  end

  def users
    RecipeCard.all.select {|e| e.user == self}
  end

  def ingredients
    RecipeIngredient.all.select {|e| e.recipe == self}
  end

  def allergens
    self.ingredients.map do |e|
      Allergen.all.select do |i|
        i.ingredient == e
      end
    end
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingre|
      RecipeIngredient.new(self, ingre)
    end
  end

end
