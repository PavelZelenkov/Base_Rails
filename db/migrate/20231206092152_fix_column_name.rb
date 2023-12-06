class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :title, :user_name
    add_column :users, :user_surname, :string
  end
end
