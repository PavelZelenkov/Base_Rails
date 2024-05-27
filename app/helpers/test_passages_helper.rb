module TestPassagesHelper

  def test_passage_url(test_passage_id)
    "http://127.0.0.1:3000/test_passages/#{test_passage_id}"
  end

  def test_passage_url_result(test_passage_id)
    "http://127.0.0.1:3000/test_passages/#{test_passage_id}/result"
  end

end
