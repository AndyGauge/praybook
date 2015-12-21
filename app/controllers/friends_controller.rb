class FriendsController < ApplicationController
	include LoggedIn
	before_action :select_user_from_login

	def index
		new_friend
	end
	def create
		@user.friends.create(friendly_params)
		render :action => 'index'
	end

	private
	def new_friend
		@friend = Person.new
	end
	def friendly_params
		params.require(:person).permit(:name, :email)
	end
end
