class UsersController < ApplicationController

	before_action :select_user_from_login, only: [:show, :edit]

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
		if current_user.guest? && @user=User.create_from_person(current_user, user_params)
			redirect_to user_url
		elsif @user=current_user && @user.update(user_params)
			redirect_to user_url
		else
			@user ||= current_user.becomes(User)  #this should only be necessary if current_user.guest? fails
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
