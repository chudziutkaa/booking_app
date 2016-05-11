class HotelsController < ApplicationController
	before_action :set_hotel, only: [ :edit, :update, :show, :destroy]

	def index
		@hotels = Hotel.all
	end

	def new
		@hotel = Hotel.new
	end

	def create
		@hotel = Hotel.new(hotel_params)
		if @hotel.save
			redirect_to hotels_path, notice: "Hotel succesfully created!"
		else
			render :new, alert: "You didn't do anything... "
		end
	end

	def update
		if @hotel.update(hotel_params)
			redirect_to hotels_path, notice: "Informations succesfully updated!"
		else
			render :edit, alert: "Upssss, something went wrong. Do it again!"
		end
	end

	def edit
	end

	def show
	end

	def destroy
		if @hotel.destroy
			redirect_to hotels_path, notice: "Hotel deleted."
		else
			redirect_to hotels_path, alert: "Your hotel is still with us"
		end
	end

	def browse
		@hotels = Hotel.browse(params[:search])
	end

	private
	def hotel_params
		params.require(:hotel).permit(:name, :standard, :description, :location)
	end

	def set_hotel
		@hotel = Hotel.find(params[:id])
	end
end