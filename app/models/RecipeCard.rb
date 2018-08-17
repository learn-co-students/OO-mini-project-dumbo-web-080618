class RecipeCard
  @@all = []

  attr_accessor :name, :user, :recipe, :date, :rating

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

  def date
    @date
  end

  def rating
    @rating
  end

  def user
    @user
  end

  def recipe
    @recipe
  end
end
