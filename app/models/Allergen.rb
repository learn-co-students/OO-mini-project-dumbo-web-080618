class Allergen
  ### `Allergen`
  # An Allergen is a join between a user and an ingredient.  This is a has-many-through relationship.  What methods should an instance of this model respond to?
  @@all = []
  attr_reader :user, :ingredient
  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end
  # - `Allergen.all`
  # should return all of the Allergen instances
  def self.all 
    @@all
  end
end