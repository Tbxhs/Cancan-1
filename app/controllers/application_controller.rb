class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logined?, :current_user
  #before_filter 

  protected

  def require_logined
  	unless  logined?
  		redirect_to new_session_path
  	end
  end

  def require_no_logined
    if logined?
      redirect_to root_url
    end
  end

  def current_user
    @current_user ||= login_from_session || login_from_cookies unless defined?(@current_user)
    @current_user
  end

  def logined?
  	!!current_user  	
  end

  def login_as(user)
  	session[:user_id] = @user.id
  	@current_user = user
  end

  def login_from_session
    if session[:user_id].present?
      begin
        User.find session[:user_id]
      rescue
        session[:user_id] = nil
      end
    end
  end

  def login_from_cookies
    if cookies[:remember_token].present?
      user = User.find_by_remember_token cookies[:remember_token] 
      forget_me unless user
      user
    end
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

end
