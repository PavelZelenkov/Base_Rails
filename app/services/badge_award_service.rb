class BadgeAwardService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @category = @test.category.title
    @user = test_passage.user
    @level = @test.level
    @badges = Badge.all
  end

  def call
    @badges.select do |badge|
      send("#{badge.condition}?", badge.condition_value)
    end
  end

  private

  def badges_count(condition)
    @user.badges.where('condition = ?', condition).count
  end

  def all_in_category?(category)
    return unless @test_passage.success? && @category == category

    tests_count = Test.by_category(category).count
    user_tests = @user.tests.by_category(category)

    tests_count == user_tests.uniq.count
  end

  def all_in_level?(level)
    return unless @test_passage.success? && @level == level.to_i

    tests_count = Test.by_level(level).count
    user_tests = @user.tests.by_level(level)

    tests_count == user_tests.uniq.count
  end

  def first_attempt?(_param)
    TestPassage.where(user: @user, test: @test).count == 1 if @test_passage.success?
  end

  def first_test?(_param)
    @test_passage.success? && badges_count(:first_test).zero?
  end
end
