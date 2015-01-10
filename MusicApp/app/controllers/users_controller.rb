class UsersController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
