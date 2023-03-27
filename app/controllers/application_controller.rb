class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  add_flash_types :success, :info, :warning, :danger

  def authenticate_user!
    unless current_user
      redirect_to login_path, danger: t('application.require_login')
    end
  end
end
