class Recipe

  attr_accessor :ingredients

  @@all = []

  def initialize(name, *ingredients)
    @name = name
    @ingredients = ingredients
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    counter = Hash.new(0)
    RecipeCard.all.select{|card| counter[card.recipe] += 1}
    counter.sort_by {|k,v| v}[-1][0]
  end

  def users
    cards = RecipeCard.all.select {|card| card.recipe == self}
    cards.map {|beef| beef.user}
  end

  def allergens
    aller_ing = []
    yay = []
    Allergen.all.each do |aller|
      aller_ing << aller.ingredient
      yay = self.ingredients[0] & aller_ing
    end
    yay
  end

  def add_ingredients(arr)
    arr.each do |ing|
    ingredients[0] << ing
    end
  end

end
