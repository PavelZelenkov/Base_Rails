module QuestionsHelper

  def question_header(question)
    if question.persisted?
      "Edit #{question.test.title} question"
    else
      "Create #{question.test.title} New Questions"
    end
  end

end
