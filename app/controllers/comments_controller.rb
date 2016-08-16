class CommentsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.new(params.require(:comment).permit(:body))
    @comment.place_id = @place.id

    if @comment.save
      redirect_to place_path(@place)
    else
      render 'new'
    end
  end

  def destroy
    @place = Place.find(params[:place_id])
    @comment =  Comment.find(params[:id])
    @comment.destroy
    redirect_to @place
  end
end
