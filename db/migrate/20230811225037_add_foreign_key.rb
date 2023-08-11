class AddForeignKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key(:tests, :categories)
    add_foreign_key(:questions, :tests)
    add_foreign_key(:answers, :questions)
    add_foreign_key(:categories, :users)
  end
end
