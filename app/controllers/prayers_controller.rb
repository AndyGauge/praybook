class PrayersController < ApplicationController
	include LoggedIn
	include Pageable
	before_action :select_user_from_login
	before_action :new_prayer, only: ['index', 'show']

	def index
		prayer_page
	end
	def show
		prayer_page params[:id].to_i
		render 'index'
	end
	def create
		@prayer = @user.prayers.new(prayer_param)
		params[:prayer][:for] && @prayer.for << Person.find(params[:prayer][:for])
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
		redirect_to prayers_path
	end
	def complete
		@prayer = find_user_prayer
		@prayer.complete! if @prayer.present?
		redirect_to prayers_path
	end
	
	private
	def new_prayer
		@prayer = @user.prayers.new(params.permit(prayer: [:body])[:prayer])
	end
  def prayer_page(num=1)
    @prayers, @prayers_for = combo_page(@user.prayers, @user.prayers_for, page: num)
  end
	def find_user_prayer
		@user.prayers.find_by_id(params[:id])
	end
	def prayer_param
		params.require(:prayer).permit(:body, :title)
	end
end
