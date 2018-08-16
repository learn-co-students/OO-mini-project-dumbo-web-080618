require 'pry'
class User < ActiveRecord::Base
  has_many :recipe_cards
  has_many :recipes, through: :recipe_cards
  has_many :allergens
  has_many :ingredients, through: :allergens

  def add_recipe_card(recipe_instance, date, rating)
    RecipeCard.create(recipe_id: recipe_instance.id, created_at: date, rating: rating, user_id: self.id)
  end

  def declare_allergen(ingredient_instance)
    Allergen.create(ingredient_id: ingredient_instance.id, user_id: self.id)
  end

  def top_three_recipes
    self.recipe_cards.order('rating DESC LIMIT 3')
  end

  def most_recent_recipe
    self.recipe_cards.order('created_at DESC LIMIT 1')
  end

  def safe_recipes
    allergens = (self.ingredients).map{|x| x.id}.uniq
    recipes = self.recipes

      out = recipes.select do |recipe|
        a = recipe.ingredients.map do |x|
          x.id
        end
        allergens.all?{|x|a.exclude?(x)}
      end
      out
    end




    # ingredient_ids = []
    #
    # allergens.each do |allergen|
    #   if !(ingredient_ids.include?(allergen.id))
    #       ingredient_ids.push(allergen.id)
    #   end
    # end
    #
    # all_ingredients = Ingredient.all




end
