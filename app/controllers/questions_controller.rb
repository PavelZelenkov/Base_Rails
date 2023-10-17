class QuestionsController < ApplicationController

  before_action :set_test, only: %i[index create]
  before_action :set_the_question, only: %i[destroy show]

  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_with_question_not_found

  def index
    @questions = @tests.questions
  end

  def destroy
    @questions.destroy
  end

  def show
    render inline: "<h1><%= @questions.body %></h1>"
  end

  def new
    @questions = Question.new
  end

  def create
    @questions = @tests.questions.new(question_params)
    if @questions.save
      redirect_to test_questions_path
    else
      render plain: 'error creating question'
    end
  end

  private

  def set_test
    @tests = Test.find(params[:test_id])
  end

  def set_the_question
    @questions = Question.find(params[:id])
  end
  
  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
