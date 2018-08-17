class User
  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select {|e| e.user == self}
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select {|e| e.user == self}
  end

  def top_three_recipes
    top_three = []
    new_arr = self.recipes.sort_by {|obj| obj.rating}.reverse
    for i in 0..2
      top_three << new_arr[i]
    end
    top_three
  end

  def most_recent_recipe
    most_recent = Date.parse('0000-01-01')
    returned_recipe = nil
    self.recipes.each do |resp|
      if most_recent < Date.parse(resp.date)
        most_recent = Date.parse(resp.date)
        returned_recipe = resp
      end
    end
    returned_recipe
  end

  def safe_recipes
    safe_array = []
    aller_temp = self.allergens.map{|a| a.ingredient}
    for x in 0..aller_temp.length-1
      safe_array << Recipe.all.select do |e|
        !e.ingredients.map {|i| i.ingredient}.include?(aller_temp[x])
      end
    end
    safe_array.uniq
  end

end
