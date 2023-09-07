class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @bike = Bicycle.find(params[:bicycle_id])
    @comment = Comment.new
  end

  def index
    @comment = Comment.all
  end

  def show
    @bike = Bicycle.find(params[:bicycle_id])
    @comment = @bike.comments.find(params[:id])
  end

  def create
    @bike = Bicycle.find(params[:bicycle_id])
    @comment = @bike.comments.new(comment_params)
    if @comment.save
      redirect_to bicycle_path(@bike.id), notice: "Comment was successfully created."
    else
      render 'new'
    end
  end

  def destroy
     @bike = Bicycle.find(params[:bicycle_id])
     @comment = @bike.comments.find(params[:id])
     @comment.destroy
     redirect_to bicycle_path(@bike.id), notice: "Nice destroy"
  end


private

  def comment_params
    params.require(:comment).permit(:body, :author)
  end


end
