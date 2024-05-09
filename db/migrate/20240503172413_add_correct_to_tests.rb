class AddCorrectToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :correct, :boolean, default: 0
  end
end
