class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, default: 0
      t.references :question, foreign_key: true, null: false

      t.timestamps
    end
  end
end
