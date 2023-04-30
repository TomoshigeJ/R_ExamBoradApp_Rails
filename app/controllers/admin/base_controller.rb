class Admin::BaseController < ApplicationController
  before_action :check_admin, :set_users, :set_q
  layout 'admin/layouts/application'

  private

  def not_authenticated
    redirect_to admin_login_path, warning: t('defaults.message.require_login')
  end

  def check_admin
    redirect_to root_path, warning: t('defaults.message.not_authorized') unless current_user.admin?
  end

  def set_users
    @users = User.all
  end

  def set_q
    @q = User.ransack(params[:q])
  end

end
