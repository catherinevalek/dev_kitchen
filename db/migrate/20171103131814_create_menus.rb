class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.integer :appetizer_id, null: false
      t.integer :salad_id, null: false
      t.integer :main_course_id, null: false
      t.integer :dessert_id, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
