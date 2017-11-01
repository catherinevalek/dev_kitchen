class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.integer :difficulty, null: false
      t.integer :prep_time
      t.text  :ingredients, null: false
      t.text :directions, null: false
      t.integer :user_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
