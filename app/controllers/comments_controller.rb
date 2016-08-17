class CommentsController < ApplicationController
  before_action :authenticate_customer!


  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.new(comment_params)
    @comment.customer = current_customer
    @comment.place_id = @place.id

    if @comment.save
      CommentMailer.new_comment(@place).deliver_now
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

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
