module QuestionsHelper

  def question_header(question)
    if question.persisted?
      t("helpers.questions_helper.question_header.edit", title: question.test.title)
    else
      t("helpers.questions_helper.question_header.create", title: question.test.title)
    end
  end

end
