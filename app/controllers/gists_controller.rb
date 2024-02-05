class GistsController < ApplicationController

  before_action :authenticate_user!

  def create
    test_passage = TestPassage.find(params[:test_passage_id])

    gist_question_service = GistQuestionService.new(test_passage.current_question)

    result = gist_question_service.call
    gist_url = result[:html_url]
    response = gist_question_service.success?

    gist = Gist.new(question: test_passage.current_question, user: test_passage.user, url: gist_url)
    if response.present? && gist.save
      flash[:notice] = t('.success', link: "#{helpers.link_to 'Ссылка на сохраненный Gist', gist_url, target: :blank}")
    else
      flash[:alert] = t('.failure')
    end

    redirect_to test_passage
  end

end
