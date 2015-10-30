class PraisesController < ApplicationController
	before_action :select_praise_from_id, only: [:show]
	def index
		@praises = Praise.all
	end

	def show
	end

	def select_praise_from_id
		@praise = Praise.find(params[:id])
	endend
