module AnswersHelper

  def correct_true_and_false
    if @answer.correct == true
      t('helpers.answers_helper.correct_true_and_false.true')
    else
      t('helpers.answers_helper.correct_true_and_false.false')
    end
  end

end
