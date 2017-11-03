class Recipe < ApplicationRecord
  belongs_to :category
  belongs_to :user

  scope :is_appetizer, -> { where(category_id: 1) }
  scope :is_salad, -> { where(category_id: 2) }
  scope :is_main_course, -> { where(category_id: 3) }
  scope :is_dessert, -> { where(category_id: 4) }


  def parse_ingredients
    ingredients.split(',')
  end

  def self.search(search)
    where("name ILIKE ? OR ingredients ILIKE ? OR directions ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
