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
	def destroy
		if @del_me = @user.friends.find_by_id(params[:id])
			@user.friends.delete(@del_me)
		end
		redirect_to friends_path
	end
	def names
		render json: (@user.friends.map do |f| {name: f.name, id: f.id};end)
	end
	
	private
	def new_friend
		@friend = Person.new
	end
	def friendly_params
		params.require(:person).permit(:name, :email)
	end
end
