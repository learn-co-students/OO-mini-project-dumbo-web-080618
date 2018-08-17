class RecipeCard

  @@all = []
  attr_reader :user, :recipe, :rating, :date
  # the stuff next to date makes it return the date in the- 
  #f ollowing format as an integer YYYYMMDD so it can be sorted chronologically
  def initialize(user, recipe, rating, date = date = Time.now.to_s.split(/[[:punct:]]/).join.split(' ').join.to_i)
    @date = date
    @user = user
    @recipe = recipe
    @rating = rating
    @@all << self
  end
 
  def self.all 
    @@all
  end
end
