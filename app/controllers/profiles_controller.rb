class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update show]

  def edit; end

  def update
    if @user.update(profiles_params)
      redirect_to profiles_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  def show; end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def profiles_params
    params.require(:user).permit(:email, :last_name, :first_name, :avatar, :avatar_cache)
  end

end
