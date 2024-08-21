class User < ApplicationRecord
  
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :categories, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :tests_created, class_name: 'Test', foreign_key: :author_id
  has_many :gists, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :badges_users, dependent: :destroy
  has_many :badges, through: :badges_users

  validates :user_name, :user_surname, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def ended_on_level(level)
    tests.level_selection(level)
  end

  def admin?
    is_a?(Admin)
  end
end
