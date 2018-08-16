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
    uniq_allergen = Allergen.all.map {|a| a.ingredient}.uniq
    allerg = []
    for x in 0..uniq_allergen.length-1
      self.ingredients.each do |i|
        if i.ingredient == uniq_allergen[x]
          allerg << i.ingredient
        end
      end
    end
    allerg
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingre|
      RecipeIngredient.new(self, ingre)
    end
  end

end
