class ProfilesController < ApplicationController
  # before action :set_user, only: %i[edit show]

  def edit
  end

  def show
    @user = User.find(current_user.id)
    #binding.pry
  end

  private

  def set_user
    # @user = User.find(current_user.id)
  end
end
