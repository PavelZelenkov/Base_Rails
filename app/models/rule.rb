class Rule < ApplicationRecord
  has_many :badges, dependent: :destroy
end
