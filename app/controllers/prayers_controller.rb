class PrayersController < ApplicationController
	before_action :select_prayer_from_id, only: [:show]
	def index
		@prayers = Prayer.all
	end

	def show
	end

	def select_prayer_from_id
		@prayer = Prayer.find(params[:id])
	end

end
