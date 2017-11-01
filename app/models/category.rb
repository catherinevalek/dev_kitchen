class Category < ApplicationRecord
  has_many :recipes

end

# A user should be able to submit a SINGLE recipe to a category 
# * Appetizer
# * Salad
# * Main Course
# * Dessert