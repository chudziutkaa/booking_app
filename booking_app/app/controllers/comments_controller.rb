class CommentsController < ApplicationController
	before_action :set_comment, only: :show

	def index
		@comments = Comment.where(hotel_id: params[:hotel_id])
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Hotel.find(params[:hotel_id]).comments.create(comment_params)
		if @comment.save
			redirect_to hotel_comments_path, notice: "Your comment has been added successfully!"
		else
			render :new, alert: "Something went wrong. Try again :)"
		end
	end

	def show
	end

	private
	def comment_params
		params.require(:comment).permit(:content, :author)
	end

	def set_comment
		@comment = Comment.find(params[:id])
	end
end