class PricesController < ApplicationController
	before_action :set_price_list, only: [ :edit, :update ]

	def index
		@price_list = Price.where(hotel_id: params[:hotel_id])
	end

	def new
		@price_list = []
		4.times do
			@price_list << Price.new
		end
	end

	def create
		if params.has_key?("price")
			@price = Hotel.find(params[:hotel_id]).prices.create!(create_price_params["price"])
		else
			params["price_list"].each do |price|
				@price = Hotel.find(params[:hotel_id]).prices.create!(create_price_params(price))
			end
		end
		if @price.save
			redirect_to hotels_path, notice: "Price added successfully"
		else
			render :new, alert: "Something went wrong. Try again!"
		end
	end

	def edit
	end

	def update
		if @price.update(update_price_params)
			redirect_to hotel_prices_path, notice: "Changes have been updated"
		else
			render :edit, alert: "Uuuuups, Something went wrong. Try again!"
		end
	end

	private

	def create_price_params(my_params)
		my_params.permit(:name, :price)
	end

	def update_price_params
		params.require(:price).permit(:name, :price)
	end

	def set_price_list
		@price = Price.find(params[:id])
	end
end