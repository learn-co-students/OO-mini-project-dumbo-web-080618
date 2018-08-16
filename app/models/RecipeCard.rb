
class RecipeCard < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe


  def date
    self.created_at
  end


end
