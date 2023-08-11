class AddNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :level, false)
    change_column_null(:tests, :category_id, false)
    change_column_null(:users, :title, false)
    change_column_null(:questions, :body, false)
    change_column_null(:questions, :test_id, false)
    change_column_null(:categories, :title, false)
    change_column_null(:categories, :user_id, false)
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :question_id, false)
  end
end
