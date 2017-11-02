class Recipe < ApplicationRecord
  belongs_to :category
  belongs_to :user


  def parse_ingredients
    ingredients.split(',')
  end

end
