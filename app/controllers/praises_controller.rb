class PraisesController < ApplicationController
	before_action :assign_current_user
	before_action :select_praise_from_id, only: [:show]
	
	def index
		@praises = @user.praises.order(created_at: :desc)
		@praise = @Praise.new({person_id: @user.id})
	end
	def show
	end
	def create
		@praise = Praise.new(praise_param.merge({person_id: @user.id}))
		if @praise.save
			redirect_to praise_path
		else
			flash[:alert] = @praise.errors
			render 'edit'
		end
	end
	def edit
		@praise = find_user_praise || Praise.new({person_id: @user.id})
	end
	def update
		@praise = find_user_praise
		@praise.update!(praise_param) if @praise.present?
		reditect_to index
	end

	private
	def select_praise_from_id
		@praise = @user.prayers.find_by_id(params[:id])
	end
	def find_user_praise
		@user.praise.find_by_id(params[:id])
	end
	def assign_current_user
		@user = current_user.becomes(User)
	end
	def praise_param
		params.require(:praise).permit(:body, :title)
	end
end
