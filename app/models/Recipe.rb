class Recipe

attr_accessor :users, :ingredients, :allergens

@@all = []

def initialize(users, ingredients, allergens)
 @users = users
 @ingredients = ingredients
 @allergens = allergens
 @@all << self
end


def self.all
  @@all
end

def self.most_popular
 @@all.max_by do |recipe|
   recipe.cards.count
 end
end


def users
  @@all.find do |recipe|
    recipe.users
  end
end


def ingredients
 @@all.each do |recipe|
   recipe.ingredients
 end
end

def allergens
  @@all.each do |recipe|
    recipe.allergens
  end
end

def add_ingredients
  @ingredients.concat(ingredients)
end

end
