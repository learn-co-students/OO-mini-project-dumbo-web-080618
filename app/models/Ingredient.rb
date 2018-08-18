class Ingredient

  @@all = []
  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def allergens
    Allergen.all.select {|allergen| allergen.ingredient == self}
  end

  def self.most_common_allergen
    all.sort_by {|ingredient| ingredient.allergens.count}.last
  end

end
