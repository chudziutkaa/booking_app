class PhotosController < ApplicationController
	before_action :authenticate_user!

	def index
		@photos = Photo.where( gallery_id: params[:gallery_id] )
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Gallery.find(params[:gallery_id]).photos.create(photo_params)
		if @photo.save
			redirect_to hotel_gallery_path(id: params[:gallery_id]), notice: "Photo has been added to your gallery."
		else
			render :new, notice: "Ups! Try again."
		end
	end

	def show
		@photo = Photo.find(params[:id])
	end

	private
	def photo_params
		params.require(:photo).permit(:image)
	end
end
