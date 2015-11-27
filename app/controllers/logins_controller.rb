class LoginsController < ApplicationController
	
	before_action :select_user_from_login, only: [:new, :root]

	def new 
	end

	def show
		self.new
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			session[:current_user_id] = @user.id
			#render the logged on page
			
		else
			redirect_to login_url, alert: "Failed to logon"
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
