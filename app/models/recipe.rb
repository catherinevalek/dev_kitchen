class Recipe < ApplicationRecord
  belongs_to :category
  belongs_to :user


  def parse_ingredients
    ingredients.split(',')
  end

  def self.search(search)
    where("name ILIKE ? OR ingredients ILIKE ? OR directions ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
