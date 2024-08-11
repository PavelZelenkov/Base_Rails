class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.string :title

      t.timestamps
    end

    create_table :badges do |t|
      t.string :title, null: false
      t.string :img_url
      t.references :rule, foreign_key: true, null: false

      t.timestamps
    end
  end
end
