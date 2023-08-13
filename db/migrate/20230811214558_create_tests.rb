class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, :null => false
      t.integer :level, default: 0
      # t.integer :category_id, :null => false
      t.references :category, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
