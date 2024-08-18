class Badge < ApplicationRecord

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :title, :img_url, :condition, :description, presence: true
  
end
