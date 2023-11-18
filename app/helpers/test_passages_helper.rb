module TestPassagesHelper

  SUCCES_RATE = 85
  
  def color_result
    if success?
      "color:#32CD32"
    else
      "color:#ff0000"
    end
  end

  def result_test
    if success?
      "Result: #{percentage_formula}% Successful completion of the test"
    else
      "Result: #{percentage_formula}% Test failed"
    end
  end

  private

  def percentage_formula
    ( @test_passage.correct_questions * 100 ) / @test_passage.test.question_ids.size
  end
  
  def success?
    percentage_formula >= SUCCES_RATE
  end

end
