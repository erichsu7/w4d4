class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if @user
      login!(@user)
    else
      render :new
    end
  end

  def destroy
    logout!(current_user)
  end
end
