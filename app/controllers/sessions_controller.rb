class SessionsController < ApplicationController
	before_filter :require_no_logined, :except => :destroy
	
	def new
		
	end

	def create
		@user = User.authenticate(params[:login], params[:password])

		if @user
			login_as @user
			flash[:notice] = "Welcom #{@user.login}"
			redirect_to new_user_path
		else
			flash[:notice] = "The login or password is not correct"
			redirect_to new_session_path
		end
	end

	def destroy
		logout
		redirect_to new_session_path
	end
end
