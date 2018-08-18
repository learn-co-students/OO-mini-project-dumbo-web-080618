class Ingredient

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  # .all should return all of the ingredient instances
  def self.all
    @@all
  end

  # .most_common_allergen should return the ingredient instance that the highest number of users are allergic to
  def self.most_common_allergen
    found_ingredients = Allergen.all.map{|i| i.ingredient}
    found_ingredients.max_by { |i| found_ingredients.count(i) }
  end

end
