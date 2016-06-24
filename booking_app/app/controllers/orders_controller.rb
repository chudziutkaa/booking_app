class OrdersController < ApplicationController
	before_action :authenticate_user!

	def index
		@orders = Hotel.find(params[:hotel_id]).orders
	end
end
