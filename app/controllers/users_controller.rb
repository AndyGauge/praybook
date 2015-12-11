class UsersController < ApplicationController

	before_action :select_user_from_login, only: [:show, :edit, :update]

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to user_url
		else
			render :action => 'edit'
		end
	end
	def new
		@user = User.new
	end
	def show
	end
	def edit
	end
	def update
		@user.update(user_params)
		if @user.save
			redirect_to user_url
		else
			render :action => 'edit'
		end
		
  end
	def select_user_from_login
		@user = current_user.becomes(User)
	end
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
