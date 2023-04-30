class Admin::UsersController < Admin::BaseController
  before_action :set_q, only: %i[index]
  before_action :set_users, only: %i[index]
  before_action :set_user, only: %i[show edit update destroy]

  def index; end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  def destroy
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end

  def set_users
    @users = @q.result(distinct: true).page(params[:page])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :avatar, :avatar_cache, :role)
  end
end
