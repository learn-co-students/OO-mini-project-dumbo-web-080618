
#A RecipeCard is the join between a user instance and a recipe instance. This is a has-many-through relationship.
class RecipeCard
  attr_accessor :date, :rating, :user, :recipe
  @@all = []

  def self.all
    @@all
  end

  def initialize(date:, rating:, user:, recipe:)
    @date = date
    @rating = rating
    @user = user
    @recipe = recipe
    @@all << self
  end


end
