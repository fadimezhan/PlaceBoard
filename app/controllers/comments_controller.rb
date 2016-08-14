class CommentsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.new(params.require(:comment).permit(:body, :place_id))
    @comment.place_id = @place.id

    if @comment.save
      redirect_to place_path(@place)
    else
      render 'new'
    end
  end
end
