class FriendsController < ApplicationController
	include LoggedIn
	before_action :select_user_from_login

	def index
	end
end
