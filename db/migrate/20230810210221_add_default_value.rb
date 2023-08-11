class AddDefaultValue < ActiveRecord::Migration[6.1]
  def up
    change_column(:tests, :level, :integer, :default => 0)
    change_column(:answers, :correct, :boolean, :default => 0)
  end

  def down
    change_column(:tests, :level, :integer, :default => nil)
    change_column(:answers, :correct, :boolean => nil)
  end
end
