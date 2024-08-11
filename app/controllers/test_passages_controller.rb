class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]
  
  def show

  end

  def result

  end

  def update
    if @test_passage.answer_selected?(params[:answer_ids])
      flash[:alert] = t('.failure')
      render :show
    else
      @test_passage.accept!(params[:answer_ids])

      if @test_passage.expired? || @test_passage.completed?
        TestsMailer.completed_test(@test_passage).deliver_now
        redirect_to result_test_passage_path(@test_passage)
        if @test_passage.success?
          passed
          # badge_user = BadgesUser.new(user_id: current_user.id, badge_ids: [])
          # badge_user.save
        end
      else
        render :show
      end
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def passed
    @test_passage.passed = true
    @test_passage.save
  end

end
