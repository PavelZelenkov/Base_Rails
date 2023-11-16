class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :num_of_answers_for_questions

  scope :correct, -> { where(correct: true) }
  
  def num_of_answers_for_questions
    errors.add(:question) if question.answers.count >= 4
  end
end
