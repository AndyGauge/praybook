class LoginsController < ApplicationController
	def new 
		#@user = guest? ? User.new : current_user
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
		@user = User.new
	end
end
