module AnswersHelper

  def correct_true_and_false
    if @answer.correct
      t('helpers.answers_helper.correct_true_and_false.true')
    else
      t('helpers.answers_helper.correct_true_and_false.false')
    end
  end

end
