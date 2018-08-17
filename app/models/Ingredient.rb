class Ingredient
### `Ingredient`
# Build the following methods on the Ingredient class
  @@all = []
  attr_reader :name
  def initialize (name)
    @name = name 
    @@all << self
  end
  # - `Ingredient.all`# should return all of the ingredient instances
  def self.all 
    @@all
  end
 
  def self.most_common_allergen
    counting_hash = {}
    max_users = 0
    common_most_allergen = nil

    Allergen.all.each{|allergen|
      if (counting_hash[allergen.ingredient] != nil)
        counting_hash[allergen.ingredient] += 1
      else
        counting_hash[allergen.ingredient] = 1
      end
    }
    counting_hash.each{|allergen, num_of_users|
      if(num_of_users > max_users)
        max_users = num_of_users
        common_most_allergen = allergen
      end
    }
    common_most_allergen
  end
end