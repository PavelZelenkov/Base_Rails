class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, :through => :test_passages

  scope :from_category, ->(category) {joins(:category).where(categories: {title: category}).order(title: :desc)}
  
  def self.test_with_category(category)
    Test.from_category(category).pluck(:title)
  end
end
