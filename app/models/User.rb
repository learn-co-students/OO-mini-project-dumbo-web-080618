
class User < ActiveRecord::Base
  has_many :recipe_card
  has_many :recipes, through: :recipe_cards
end
