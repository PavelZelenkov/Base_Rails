class Admin::QuestionsController < Admin::BaseController

  before_action :set_test, only: %i[new create]
  before_action :set_the_question, only: %i[destroy show edit update]

  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_with_question_not_found

  def destroy
    @question.destroy

    redirect_to admin_test_path(@question.test)
  end

  def show

  end

  def new
    @question = @tests.questions.new
  end

  def edit

  end

  def create
    @question = @tests.questions.new(question_params)
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  private

  def set_test
    @tests = Test.find(params[:test_id])
  end

  def set_the_question
    @question = Question.find(params[:id])
  end
  
  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
