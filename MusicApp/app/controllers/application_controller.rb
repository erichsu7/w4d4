class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
    redirect_to user_url
  end

  def logout!(user)
    user.reset_session_token!
    session[:session_token] = nil
    redirect_to root_url
  end

  def redirect_if_logged_in
    redirect_to user_url if logged_in?
  end

  def redirect_if_logged_out
    redirect_to new_session_url unless logged_in?
  end
end
