class GalleriesController < ApplicationController
	before_action :set_gallery, only: [ :show, :edit ]
	def index
		@galleries = Gallery.all
	end

	def new
		@gallery = Gallery.new
	end

	def create
		@gallery = Hotel.find(params[:hotel_id]).create_gallery(gallery_params)
		if @gallery.save
			if params[:images]
				params[:images].each do |image|
					@gallery.photos.create( image: image )
				end
			end
			redirect_to hotels_path, notice: "You created your hotel's gallery"
		else
			render :new, alert: "Unexpectable error. Try again."
		end
	end

	def show
		@photos = @gallery.photos
	end

	def edit
	end

	private
	def gallery_params
		params.require(:gallery).permit(:name)
	end

	def set_gallery
		@gallery = Gallery.find(params[:id])
	end
end