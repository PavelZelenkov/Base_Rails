require 'digest/sha1'

class User < ApplicationRecord

  has_many :categories, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :tests_created, class_name: 'Test', foreign_key: :author_id

  before_save { self.email = email.downcase }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :title, presence: true, uniqueness: true
  validates :email, presence: true,
            uniqueness: true, 
            format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def ended_on_level(level)
    tests.level_selection(level)
  end
end
