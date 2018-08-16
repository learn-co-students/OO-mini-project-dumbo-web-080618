class RecipeCard
  attr_reader :date, :user, :rating, :recipe
  @@all = []

  def initialize(recipe, date, rating, user)
    @recipe = recipe
    @date = date
    @rating = rating
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

end
