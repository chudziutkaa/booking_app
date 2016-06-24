class RoomsController < ApplicationController
	before_action :set_room, only: [ :edit, :show, :update, :rent ]

	before_action :authenticate_user!

	def index
		@rooms = Room.where(hotel_id: params[:hotel_id])
	end

	def new
		@room = Room.new
	end

	def create
		@room = Hotel.find(params[:hotel_id]).rooms.create!(room_params)
		if @room.save
			redirect_to hotel_rooms_path, notice: "New room has been created!"
		else
			render :new, alert: "Something went wrong. Try again!"
		end
	end

	def edit
	end

	def update
		if @room.update(room_params)
			redirect_to hotel_rooms_path, notice: "Informations succesfully updated!"
		else
			render :edit, alert: "Upssss, something went wrong. Do it again!"
		end
	end

	def show
	end

	def rent
		Order.create!(room: @room, start_time: Time.now)
		redirect_to hotels_path, notice: "Reservation added!"
	end

	def unrent
		order = Order.find(params[:order_id])
		order.update(end_time: Time.now)
		redirect_to hotels_path, notice: "You unrented room"
	end

	private
	def room_params
		params.require(:room).permit(:number, :name)
	end

	def set_room
		@room = Room.find(params[:id])
	end
end
