class PraisesController < ApplicationController
	before_action :assign_current_user
	before_action :select_praise_from_id, only: [:show]
	def index
		@praises = @user.praises
	end

	def show
	end

	private
	def select_praise_from_id
		@praise = Praise.find(params[:id])
	end
	def assign_current_user
		@user = current_user
	end

end
