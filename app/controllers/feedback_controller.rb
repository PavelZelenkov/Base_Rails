class FeedbackController < ApplicationController

  before_action :authenticate_user!
  
  def create
    @feedback = current_user.feedbacks.new(feedback_params)
    if @feedback.save
      FeedbackMailer.feedback_email(@feedback).deliver_now
      flash[:notice] = t('.success')
      redirect_to tests_path
    else
      flash[:alert] = t('.failure')
      redirect_to feedback_index_path
    end
  end

  private

  def feedback_params
    params.permit(:body)
  end

end
