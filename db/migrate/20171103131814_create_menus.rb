class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.integer :appetizer, null: false
      t.integer :salad, null: false
      t.integer :main_dish, null: false
      t.integer :dessert, null: false

      t.timestamps
    end
  end
end
