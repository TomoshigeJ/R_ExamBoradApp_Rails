class Admin::UsersController < Admin::BaseController
  before_action :set_q, only: [:index]
  before_action :set_users, only: [:index]

  def index; end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
