class PraisesController < ApplicationController
	before_action :assign_current_user

	def index
		@praises = @user.praises.order(created_at: :desc)
		@praise = Praise.new({person_id: @user.id})
	end
	def show
		@prayers = Praise.page(params[:id]).order(created_at: :desc)
	end
	def create
		@praise = Praise.new(praise_param.merge({person_id: @user.id}))
		if @praise.save
			redirect_to praises_path
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
	def find_user_praise
		@user.praises.find_by_id(params[:id])
	end
	def assign_current_user
		@user = current_user.becomes(User)
	end
	def praise_param
		params.require(:praise).permit(:body, :title)
	end
end
