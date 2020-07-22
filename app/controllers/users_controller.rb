# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path, success: 'User was successfully edited!'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find_by(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
