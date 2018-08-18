class RecipeCard

  attr_accessor :user, :recipe, :date, :rating

  @@all = []

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end

# RecipeCard.all should return all of the RecipeCard instances
  def self.all
    @@all
  end

  #date should return the date of the entry
  def date
    @date
  end

  #rating should return the rating (an integer) a user has given their entry
  def rating
    @rating
  end

  #user should return the user to which the entry belongs
  def user
    @user
  end

  #recipe should return the recipe to which the entry belongs
  def recipe
    @recipe
  end


end
