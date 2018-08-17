class Allergen
  @@all = []

  attr_accessor :user, :ingredient

  def initialize(user, ingredient)
    @ingredient = ingredient
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end
end
