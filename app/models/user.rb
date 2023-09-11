class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :tests_created, class_name: 'Test', foreign_key: :author_id

  def ended_on_level(level)
    tests.where(tests: {level: level})
  end
end
