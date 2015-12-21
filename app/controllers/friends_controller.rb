class FriendsController < ApplicationController
	include LoggedIn
	before_action :select_user_from_login

	def index
		new_friend
	end
	def create
		if @p = Person.find_by_email(params[:person][:email])
			@user.friends << @p
		else
			@user.friends.create(friendly_params)
		end
		redirect_to friends_path
	end

	private
	def new_friend
		@friend = Person.new
	end
	def friendly_params
		params.require(:person).permit(:name, :email)
	end
end
