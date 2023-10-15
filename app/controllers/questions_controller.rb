class QuestionsController < ApplicationController

  before_action :set_test, only: %[index]

  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_with_question_not_found

  def index
    @questions = @tests.questions.all
  end

  def destroy
    @questions = Question.find(params[:id])
    @questions.destroy
  end

  def show
    @questions = Question.find(params[:id])
    render inline: "<h1><%= @questions.body %></h1>"
  end

  def new
    @questions = Question.new
  end

  def create
    @tests = Test.find(params[:test_id])
    @questions = @tests.questions.create(question_params)
    redirect_to test_questions_path
  end

  private

  def set_test
    @tests = Test.find(params[:test_id])
  end
  
  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
