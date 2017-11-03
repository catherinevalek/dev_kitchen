class Menu < ApplicationRecord

  validates :appetizer, :salad, :main_course, :dessert, presence: true
  has_one :appetizer, foreign_key: :appetizer_id, class_name: "Recipe"
  has_one :salad, foreign_key: :salad_id, class_name: "Recipe"
  has_one :main_course, foreign_key: :main_course_id, class_name: "Recipe"
  has_one :dessert, foreign_key: :dessert_id, class_name: "Recipe"
  # menu.appetizer = Recipe.find(params[:appetizer_id])

  def self.appetizers
    Recipe.is_appetizer
  end

  def self.salads
    Recipe.is_salad
  end

  def self.main_courses
    Recipe.is_main_course
  end

  def self.desserts
    Recipe.is_dessert
  end
end
