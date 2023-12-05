class Admin::TestsController < Admin::BaseController
  
  before_action :set_test, only: %i[destroy show edit update]

  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_with_test_not_found
  
  def index
    @tests = Test.all
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path
  end

  def show

  end

  def new
    @test = Test.new
  end

  def edit

  end

  def create
    @test = Test.new(test_params)
    test_author_id
    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def test_author_id
    @test.author_id = current_user.id
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
