class LoginsController < ApplicationController
	
	before_action :select_user_from_login, only: [:new, :root, :show]

	def new 
	end

	def show
		render "new"
	end

	def create
		@user = User.find_by_email(params[:login][:email])
		if @user && @user.authenticate(params[:login][:password])
			session[:current_user_id] = @user.id
			redirect_to prayers_path
			
		else
			redirect_to login_path, alert: "Failed to logon"
		end
	end
	def destroy
		slay_current_user
		redirect_to root_url
	end

	def root
	end
	def select_user_from_login
		@user = current_user.becomes(User)
	end
end
