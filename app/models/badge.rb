class Badge < ApplicationRecord

  belongs_to :rule

  has_many :badges_tests, dependent: :destroy
  has_many :tests, through: :badges_tests

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :title, :img_url, presence: true
  
end
