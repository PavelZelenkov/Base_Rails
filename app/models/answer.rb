class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :num_of_answers

  def num_of_answers
    errors.add(:question) if question.answers.count >= 4
  end
end
