class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def self.test_with_category(category)
    Test.joins(:category).where(categories: {title: category}).order(title: :desc).pluck(:title)
  end
end
