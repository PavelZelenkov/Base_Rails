class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level,
    message: "С данным уровнем тест уже существует" }
  validates :level, numericality: { only_integer: true }

  scope :level_selection, -> (level) { where(level: level) }

  scope :easy, -> { level_selection(0..1) }
  scope :normal, -> { level_selection(2..4) }
  scope :heavy, -> { level_selection(5..Float::INFINITY) }

  # default_scope { order(title: :asc) } # закомментировал данный скоуп и эту сортировку добавил в метод класса

  scope :with_category, -> (category) { joins(:category).where(categories: {title: category})}

  def self.test_with_category(category)
    Test.with_category(category).order(title: :asc).pluck(:title)
  end
end
