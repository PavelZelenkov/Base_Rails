class AddDetailsToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :current_question_id, :integer
    add_column :test_passages, :correct_questions, :integer, default: 0
  end
end
