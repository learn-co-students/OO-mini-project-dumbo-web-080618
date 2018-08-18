class RecipeCard

  attr_reader :user, :recipe, :rating, :date
  @@all = []

  def initialize(recipe, user, date, rating)
    @recipe = recipe
    @user = user
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
