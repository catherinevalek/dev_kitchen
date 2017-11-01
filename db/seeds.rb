# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_array = 10.times.collect do User.create!(username: Faker::HarryPotter.character, email: Faker::Internet.safe_email, pw_hash: "pass")
end
category_array = [Category.create!( name: "Appetizer" ), Category.create!( name: "Salad" ), Category.create!( name: "Main Course" ), Category.create!( name: "Dessert" )]

recipe_array = 20.times.collect do Recipe.create!( name: Faker::Food.dish, difficulty: [1, 2, 3].sample, prep_time: [100, 25, 30].sample, ingredients: "#{Faker::Food.ingredient} #{Faker::Food.measurement}", directions: Faker::Lorem.paragraph, user_id: user_array.sample.id, category_id: category_array.sample.id) end




