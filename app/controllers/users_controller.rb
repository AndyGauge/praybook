class UsersController < ApplicationController

	before_action :select_user_from_login, only: [:show, :edit]

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_url
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

	def select_user_from_id
		@user = User.find(param[:id])
	end
	def select_user_from_login
		@user = current_user
	end

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def current_user
		super().becomes(User)
	end

end
