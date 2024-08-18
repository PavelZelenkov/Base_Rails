class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img_url
      t.string :condition

      t.timestamps
    end
  end
end
