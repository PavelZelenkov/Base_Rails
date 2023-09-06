class Question < ApplicationRecord
  belongs_to :test # связь с моделью test
  has_many :answers, dependent: :destroy # связь с моделями answers
end
