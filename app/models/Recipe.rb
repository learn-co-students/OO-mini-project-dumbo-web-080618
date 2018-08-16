
class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :users, through: :recipe_cards

  has_many :recipe_ingredients

  has_many :ingredients, through: :recipe_ingredients
end
