class OrdersController < ApplicationController
	def index
		@orders = Hotel.find(params[:hotel_id]).orders
	end
end