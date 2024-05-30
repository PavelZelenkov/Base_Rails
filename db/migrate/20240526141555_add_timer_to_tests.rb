class AddTimerToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :test_time, :integer, default: 0
  end
end
