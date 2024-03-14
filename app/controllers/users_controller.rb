class UsersController < ApplicationController
  def login
  end

  def signup
  end

  def create
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
