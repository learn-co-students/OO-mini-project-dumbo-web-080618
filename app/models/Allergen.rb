class Allergen

  attr_reader :ingredient

  @@all = []

  def initialize(ingredient)
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all 
  end

end
