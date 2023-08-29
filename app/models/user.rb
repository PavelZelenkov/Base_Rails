class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, :through => :test_passages

  def ended_on_level(level)
    tests.joins(:test_passages).where(tests: {level: level},
    test_passages: {user_id: id})
  end
end
