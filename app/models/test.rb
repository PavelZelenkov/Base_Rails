class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :level,
    message: "С данным уровнем тест уже существует" }

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :heavy, -> { where(level: 5..Float::INFINITY) }

  scope :level_selection, -> (level) { where(level: level) }

  default_scope { order(title: :asc) }

  scope :with_category, -> (category) { joins(:category).where(categories: {title: category}).pluck(:title) }
end
