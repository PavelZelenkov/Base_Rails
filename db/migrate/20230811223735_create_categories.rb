class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
    change_column_null(:categories, :title, false)
    change_column_null(:categories, :user_id, false)
  end
end
