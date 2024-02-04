class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist gist_create]
  
  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist_create(gist_params)
    @gist = Gist.new(gist_params)
    if @gist.save
    else
      redirect_to @test_passage, flash[:alert] = t('.failure')
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    gist_url = result[:html_url]
    result = GistQuestionService.new(@test_passage.current_question).success?

    gist_create(question: @test_passage.current_question, user: @test_passage.user, url: gist_url)

    flash_options = if result.present?
      { notice: t('.success', link: "#{helpers.link_to 'Ссылка на сохраненный Gist', gist_url, target: :blank}") }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
