class BicyclesController < ApplicationController

  before_action :authenticate_user!


  def new
    @bike = Bicycle.new
  end

  def create
    @bike = current_user.bicycles.new(bicycle_params)
    if @bike.save
      redirect_to bicycles_path, notice: 'Bicycle was successfully added.'
    else
      render 'new'
    end
  end


  def edit
    @bike = Bicycle.find(params[:id])
    redirect_to root_path unless can? :edit, @bike
  end

  def update
    @bike = Bicycle.find(params[:id])
      if @bike.update_attributes(bicycle_params)
    redirect_to bicycle_path(@bike.id)
      else
    render 'edit'
      end
  end

  def destroy
    @bike = Bicycle.find(params[:id])
      if can? :destroy, @bike
    @bike.destroy
    redirect_to bicycles_path
      else
    redirect_to root_path
      end
  end

  def index
    @q = Bicycle.ransack(params[:q])
    @bikes = @q.result.accessible_by(current_ability)
  end

  def show
    @bike = Bicycle.find(params[:id])
    unless can? :show, @bike
      redirect_to bicycles_path
    end
    @comments = @bike.comments
    @sugs = @bike.suggestions
  end

  def vote
    @bike = Bicycle.find(params[:id])
    if current_user.liked? @bike
      @bike.unliked_by current_user
    else
      @bike.liked_by current_user
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def bicycle_params
    params.require(:bicycle).permit(:name, :description, :picture, :user_id, :category_id)
  end
end
