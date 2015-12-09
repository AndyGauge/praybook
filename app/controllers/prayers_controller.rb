class PrayersController < ApplicationController
	before_action :assign_current_user

	def index
		@prayers = @user.prayers.order(created_at: :desc)
		@prayer = Prayer.new({person_id: @user.id})
	end
	def show
		@prayers = Prayer.page(params[:id]).order(created_at: :desc)
	end
	def create
		@prayer = Prayer.new(prayer_param.merge({person_id: @user.id}))
		if @prayer.save
			redirect_to prayers_path
		else
			flash[:alert] = @prayer.errors
			render 'edit'
		end
	end
	def edit
		@prayer = find_user_prayer || Prayer.new({person_id: @user.id})
	end
	def update
		@prayer = find_user_prayer
		@prayer.update!(prayer_param) if @prayer.present?
		redirect_to index
	end
	def complete
		@prayer = find_user_prayer
		@prayer.complete! if @prayer.present?
		redirect_to index
	end
	
	private
	def assign_current_user
		@user = current_user.becomes(User)
	end
	def find_user_prayer
		@user.prayers.find_by_id(params[:id])
	end
	def prayer_param
		params.require(:prayer).permit(:body, :title)
	end
end
