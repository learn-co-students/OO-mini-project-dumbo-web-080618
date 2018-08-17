#An Allergen is a join between a user and an ingredient. This is a has-many-through relationship.
class Allergen
  attr_accessor :user, :ingredient
  @@all = []

  def initialize(user:, ingredient:)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

end
