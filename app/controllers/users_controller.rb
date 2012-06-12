class UsersController < ApplicationController
	before_filter :require_no_logined
	def new
		@user = User.new
	end

	def create
		@user = User.new params[:user]
		@user.password= params[:user][:password]
		@user.password_confirmation = params[:user][:password_confirmation]
		if @user.save
			login_as @user
			#redirect_back_or_default root_url
		else
			render :new
		end
	end

	def show
		@user = User.find params[:id]
	end

	def edit
		@user = current_user
	end
end
