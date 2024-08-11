class Admin::BadgesController < Admin::BaseController

  before_action :set_badge, only: %i[destroy show edit update]
  before_action :fetch_tests, only: %i[new edit]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def edit # не нужен? так как при перезаписи, тесты не меняются, только через удаление и создание нового бейджа

  end

  def create
    @badge = Badge.new(badge_params)
    rule_selection

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :img_url, :rule_id, test_ids: [])
  end

  def fetch_tests
    @tests = Test.all
  end

  def rule_selection
    if @badge.rule_id == 1
      @badge.test_ids = Test.backend.ids # Правило применимое к категории backend
    elsif @badge.rule_id == 2
      @badge.test_ids = Test.frontend.ids # Правило применимое к категории frontend
    elsif @badge.rule_id == 3
      @badge.test_ids = Test.mobile_development.ids # Правило применимое к категории mobile development
    elsif @badge.rule_id == 4
      @badge.test_ids = Test.easy.ids # Правило применимое к легким тестам (от 0...1)
    elsif @badge.rule_id == 5
      @badge.test_ids = Test.normal.ids # Правило применимое к средней сложности тестам (от 2...4)
    elsif @badge.rule_id == 6
      @badge.test_ids = Test.heavy.ids # Правило применимое к сложным тестам (от 5 и выше)
    else
      @badge.test_ids = Test.all.ids # Правило применимое ко всем тестам
    end
  end

end
