class Category < ApplicationRecord
  has_many :tests, dependent: :destroy # связь с моделями tests
end
