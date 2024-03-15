class Admin::TestsController < Admin::BaseController
  
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[destroy show edit update update_inline]

  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_with_test_not_found
  
  def index

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
    @test = current_user.tests_created.new(test_params)
    if @test.save
      redirect_to admin_tests_path, notice: t('.success')
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

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
