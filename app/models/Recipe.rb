
class Recipe < ActiveRecord::Base
  has_many :recipe_card
  has_many :users, through: :recipe_cards
end
