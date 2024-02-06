class GistQuestionService

  require 'octokit'
  require 'dotenv'
  Dotenv.load

  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = set_client
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    response = @client.last_response
    response.status
    if response.status == 201
      true
    else
      false
    end
  end

  private

  def gist_params
    options = { description: I18n.t('app.services.gist_question_service.gist_params.text', title: @test.title),
    public: false,
    files: {"test-guru-question.txt": {content: gist_content}}
  }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def set_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

end
