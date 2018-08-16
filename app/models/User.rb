class User


  attr_accessor :name, :recipes, :allergens

@@all = []

def initialize(name)
  @name = name
@@all << self
end

def self.all
 @@all
end


def recipes
 self.recipes
end


def add_recipe_card(recipe, date, rating)
  RecipeCard.new(recipe, date, self, rating)
end


def declare_allergen(ingredient)
  Allergen.new(ingredient, self)
end


def allergens
  self.allergens
end


def top_three_recipes

end

def most_recent_recipe

end

def safe_recipes(allergens)
  if @@all.find do |recipe|
    recipe.allergens =! allergens
    return recipe.recipes
    end
  end
end


end
