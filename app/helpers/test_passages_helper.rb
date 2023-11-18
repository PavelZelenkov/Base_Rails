module TestPassagesHelper

  def color_result
    if @test_passage.success?
      "color:#32CD32"
    else
      "color:#ff0000"
    end
  end

  def result_test
    if @test_passage.success?
      "Result: #{@test_passage.percentage_formula}% Successful completion of the test"
    else
      "Result: #{@test_passage.percentage_formula}% Test failed"
    end
  end

end
