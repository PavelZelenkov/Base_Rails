class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :title

      t.timestamps
    end
    change_column_null(:users, :title, false)
  end
end
