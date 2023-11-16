module TestPassagesHelper

  def percentage_formula
    ( @test_passage.correct_questions * 100 ) / @test_passage.test.question_ids.size
  end
  
  def color_result
    if (percentage_formula) >= 85
      "color:#32CD32"
    elsif (percentage_formula) < 85
      "color:#ff0000"
    end
  end

  def result_test
    if (percentage_formula) >= 85
      "Result: #{percentage_formula}% Successful completion of the test"
    elsif (percentage_formula) < 85
      "Result: #{percentage_formula}% Test failed"
    end
  end

end
