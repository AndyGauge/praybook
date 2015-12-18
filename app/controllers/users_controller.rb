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
			if @user.persisted?
				session[:current_user_id] = @user.id 
				redirect_to user_url and return
		else 
			@user=current_user 
			redirect_to user_url and return if @user.update(user_params)
		end		
		@user ||= current_user.becomes(User) 
		render :action => 'edit'		
  end
	def select_user_from_login
		@user = current_user.becomes(User)
	end
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
