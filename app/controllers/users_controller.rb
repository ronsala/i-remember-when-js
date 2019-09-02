# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :bio, :admin)
  end
end