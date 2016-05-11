class PhotosController < ApplicationController
	def index
		@photos = Photo.where( gallery_id: params[:gallery_id] )
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.create!( gallery: @gallery, params: photo_params )
		if @photo.save
			redirect_to hotel_gallery_path, notice: "Photo has been added to your gallery."
		else
			render :new, notice: "Ups! Try again."
		end
	end

	def show
		@photo = Photo.find(params[:id])
	end

	# private
	# def photo_params
	# 	params.require(:photo).permit(:image)
	# end
end