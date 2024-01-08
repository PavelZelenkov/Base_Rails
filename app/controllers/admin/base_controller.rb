class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: t('admin.base_controller.admin_required!.alert_admin') unless current_user.admin?
  end

end
