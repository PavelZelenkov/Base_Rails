class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct
      t.integer :question_id

      t.timestamps
    end
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :question_id, false)
  end

  def up
    change_column(:answers, :correct, :boolean, :default => 0)
  end

  def down
    change_column(:answers, :correct, :boolean, :default => nil)
  end
end
