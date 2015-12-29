class PraisesController < ApplicationController
	include LoggedIn
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
		@praises = @user.praises.page(num).order(created_at: :desc)
    if @praises.count < Praise.per_page && @praises.total_pages == num
      @praises_for = @user.praises_for.limit(Praise.per_page - @praises.count) 
    elsif @praises.total_pages < num
      @praises_for = @user.praises_for.limit(Praise.per_page).offset(num * Praise.per_page - @praises.count)
    end
  end
	end
	def find_user_praise
		@user.praises.find_by_id(params[:id])
	end
	def praise_param
		params.require(:praise).permit(:body, :title)
	end
end
