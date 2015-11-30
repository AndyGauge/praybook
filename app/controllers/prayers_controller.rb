class PrayersController < ApplicationController
	before_action :assign_current_user

	def index
		@prayers = @user.prayers
		@proto_prayer = Prayer.new({person_id: @user.id})
	end
	def show
		@prayer = Prayer.find(params[:id])
	end
	def create
		@prayer = Prayer.new(prayer_param.merge({person_id: @user.id}))
		if @praye.save
			redirect_to prayers_path
		else
			render 'show'
		end
	end
	
	private
	def assign_current_user
		@user = current_user.becomes(User)
	end
	def prayer_param
		params.require(:prayer).permit(:body, :title)
	end
end
