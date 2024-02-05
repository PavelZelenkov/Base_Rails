class GistsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[new create]

  def new
    @gist = Gist.new
  end

  def create
    result = GistQuestionService.new(@test_passage.current_question).call
    gist_url = result[:html_url]
    result = GistQuestionService.new(@test_passage.current_question).success?

    @gist = Gist.new(question: @test_passage.current_question, user: @test_passage.user, url: gist_url)
    if result.present? && @gist.save
      flash[:notice] = t('.success', link: "#{helpers.link_to 'Ссылка на сохраненный Gist', gist_url, target: :blank}")
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

end
