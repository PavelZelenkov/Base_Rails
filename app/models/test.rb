class Test < ApplicationRecord
  belongs_to :category # связь с моделью category
  has_many :questions, dependent: :destroy # связь с моделями questions
  has_many :test_passages, dependent: :destroy # связь с промежуточной моделью test_passage
  has_many :users, through: :test_passages # связь с моделью user через промежуточную модель test_passage

  def self.test_with_category(category)
    Test.joins(:category).where(categories: {title: category}).order(title: :desc).pluck(:title)
  end
end
