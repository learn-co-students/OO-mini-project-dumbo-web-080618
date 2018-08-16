
class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :allergens
  has_many :users, through: :allergens



  def self.most_common_allergen
    hash = Allergen.all.group('ingredient_id').count('ingredient_id')
    array = hash.max_by{|key, value| value}
    Ingredient.find(array[0])
  end


end
