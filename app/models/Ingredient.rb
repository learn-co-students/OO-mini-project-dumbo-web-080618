require 'pry'
class Ingredient
  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    most_common = 0
    returned_recipe = nil
    self.all.each do |i|
      if most_common < self.allergen_count(i)
        most_common = self.allergen_count(i)
        returned_recipe = i
      end
    end
    returned_recipe
  end

  def self.allergen_count(allergen)
    Allergen.all.select {|e| e.ingredient == allergen}.length
  end

end
