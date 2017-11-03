class Menu < ApplicationRecord

  validates :appetizer, :salad, :main_course, :dessert, presence: true

end
