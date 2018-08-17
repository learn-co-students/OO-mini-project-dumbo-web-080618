class Recipe
  @@all = []

  attr_reader :name
  def initialize (name)
    @name = name
    @@all << self
  end

  # - `Recipe.all`-> should return all of the recipe instances
  def self.all 
    @@all
  end

  def recipe_ingredients
    RecipeIngredient.all.select{|rec_ingredient|
      self == rec_ingredient.recipe}
  end
  # - `Recipe#ingredients`
  # should return all of the ingredients in this recipe
  def get_ingredients
    recipe_ingredients.map{|rec_ingredient| rec_ingredient.ingredient}.uniq
  end

  # - `Recipe#add_ingredients`
  # should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
  def add_ingredients(ingredients_array)
    ingredients_array.each{|ingredient|
      RecipeIngredient.new(self, ingredient)}
  end

# TODO: Once Allergen class is made/can initialize do this:
  def allergens
    Allergen.all.select{|allergen| get_ingredients.include?(allergen.ingredient)}.map{|allergen| allergen.ingredient}
  end

  def self.most_popular 
    recipe_hash = {}
    max_users = 0
    most_popular = nil
    RecipeCard.all.each{|r_card|
      if (recipe_hash[r_card.recipe.name] != nil)
        recipe_hash[r_card.recipe.name] += 1
      else
        recipe_hash[r_card.recipe.name] = 1
      end
    }
    recipe_hash.each{|recipe_name, num_of_users|
      if(num_of_users > max_users)
        max_users = num_of_users
        most_popular = recipe_name
      end
    }
    Recipe.all.find{|recipe| recipe.name == most_popular}
  end
  # - `Recipe#users` ->should return the user instances who have recipe cards with this recipe
  def users
    RecipeCard.all.select{|r_card| r_card.recipe == self}.map{|select_cards| select_cards.user}
  end

end
