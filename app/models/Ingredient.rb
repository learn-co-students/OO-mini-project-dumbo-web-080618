class ingredient

attr_accessor :recipe


@@all = []


def initialize
 @@all << self
end


def self.all
 @@all
end


def most_common_allergen
Ingredient.all.max_by do |recipe|
  recipe.allergens.count
  end
end


end
