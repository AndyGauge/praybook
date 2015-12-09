class PraisesController < ApplicationController
	before_action :assign_current_user
	before_action :new_praise, only: ['index', 'show']

	def index
		praise_page 1
	end
	def show
		praise_page params[:id]
		render 'index'
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
		redirect_to index
	end

	private
	def new_praise
		@praise = Praise.new({person_id: @user.id})
	end
	def praise_page(num=1)
		@praises = @user.praises.page(num).order(created_at: :desc)
	end
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
