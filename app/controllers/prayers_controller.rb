class PrayersController < ApplicationController
	before_action :assign_current_user

	def index
		@prayers = @user.prayers
		@proto_prayer = Prayer.new({person_id: @user.id})
	end
	def show
		@prayer = Prayer.find(params[:id])
	end

	private
	def assign_current_user
		@user = current_user.becomes(User)
	end
end
