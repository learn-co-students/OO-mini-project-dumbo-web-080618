class Ingredient

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_common_allergen
    counter = Hash.new(0)
    User.all.select do |user|
      user.allergens.each do |ingredient|
        counter[ingredient] += 1
      end
    end
    counter.sort_by {|k,v| v}[-1][0]
  end

end
