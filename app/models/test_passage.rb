class TestPassage < ApplicationRecord
  belongs_to :user # связь с моделью user
  belongs_to :test # связь с моделью test
end
