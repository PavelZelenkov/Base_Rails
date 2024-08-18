class AddConditionValueToBadge < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :condition_value, :string
  end
end
