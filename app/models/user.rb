class User < ApplicationRecord
  has_many :categories, dependent: :destroy # связь с модеями categories
  has_many :test_passages, dependent: :destroy # связь с моделью test_passage
  has_many :tests, through: :test_passages # связь с моделью test через промежуточную модель test_passage

  def ended_on_level(level)
    tests.where(tests: {level: level})
  end
end
