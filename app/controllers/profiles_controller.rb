class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit show]

  def edit; end

  def update
    
  end

  def show; end

  private

  def set_user
    @user = User.find(current_user.id)
  end
end
