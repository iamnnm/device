# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_current_user, only: %i[edit update]

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    redirect_to root_path, error: 'Don\'t fuck with me!' if @user.nil?
  end

  def update
    if !@user.nil? && @user.update(user_params)
      redirect_to user_path, success: 'User was successfully edited!'
    else
      render :edit
    end
  end

  private

  def set_current_user
    if !current_user.nil?
      @user = User.find_by(id: current_user.id )
    else
      @user = nil
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
