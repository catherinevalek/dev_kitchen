class Menu < ApplicationRecord

  validates :appetizer_id, :salad_id, :main_course_id, :dessert_id, presence: true
  # has_one :appetizer, class_name: "Recipe"
  # has_one :salad, class_name: "Recipe"
  # has_one :main_course, class_name: "Recipe"
  # has_one :dessert, class_name: "Recipe"
  # menu.appetizer = Recipe.find(params[:appetizer_id])

  def appetizer
    Recipe.find(self.appetizer_id)
  end

  def salad
    Recipe.find(self.salad_id)
  end

  def main_course
    Recipe.find(self.main_course_id)
  end

  def dessert
    Recipe.find(self.dessert_id)
  end

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

  def self.menu_today
    Menu.where("date >= ?", Time.now)
  end

end
