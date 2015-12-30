class PraisesController < ApplicationController
	include LoggedIn
	include Pageable
	before_action :select_user_from_login
	before_action :new_praise, only: ['index', 'show']

	def index
		praise_page 1
	end
	def show
		praise_page params[:id].to_i
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
		redirect_to praises_path
	end

	private
	def new_praise
		@praise = Praise.new({person_id: @user.id})
	end
	def praise_page(num=1)
		@praises, @praises_for = combo_page(@user.praises, @user.praise_for, page: num)
  end
	def find_user_praise
		@user.praises.find_by_id(params[:id])
	end
	def praise_param
		params.require(:praise).permit(:body, :title)
	end
end
