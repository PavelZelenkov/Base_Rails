class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]
  
  def show

  end

  def result

  end

  def update
    if (Time.new >= @test_passage.created_at + (@test_passage.test_time * 60))
      flash[:alert] = t('.time_is_over', link: "#{helpers.link_to t('.result_page'), result_test_passage_path}")
      render :show
    elsif @test_passage.answer_selected?(params[:answer_ids])
      flash[:alert] = t('.failure')
      render :show
    else
      @test_passage.accept!(params[:answer_ids])

      if @test_passage.completed?
        TestsMailer.completed_test(@test_passage).deliver_now
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
