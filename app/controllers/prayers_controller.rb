class PrayersController < ApplicationController
	before_action :assign_current_user
	before_action :select_prayer_from_id, only: [:show]
	def index
		@prayers = @user.prayers
	end

	def show
	end

	private
	def select_prayer_from_id
		@prayer = Prayer.find(params[:id])
	end
	def assign_current_user
		@user = current_user
	end

end
