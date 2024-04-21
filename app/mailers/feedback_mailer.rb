class FeedbackMailer < ApplicationMailer

  def feedback_email(feedback)
    @user_email = feedback.user.email
    @user_name = feedback.user.user_name
    @body = feedback.body

    mail to: "artas@gmail.com", subject: 'FeedBack | TestGuru'
  end

end