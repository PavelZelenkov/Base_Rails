class CreateBadgesTests < ActiveRecord::Migration[6.1]
  def change
    create_table :badges_tests do |t|
      t.belongs_to :test, null: false, foreign_key: true
      t.belongs_to :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
