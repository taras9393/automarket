class BicyclesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]


  def new
    @bike = Bicycle.new
  end

  def create
    @bike = current_user.bicycles.new(bicycle_params)
    if @bike.save
      redirect_to bicycles_path
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
    @bikes = Bicycle.paginate(page: params[:page], per_page: 4).accessible_by(current_ability)
  end

  def show
    @bike = Bicycle.find(params[:id])
    unless can? :show, @bike
      redirect_to bicycles_path
    end
  end

  def bicycle_params
    params.require(:bicycle).permit(:name, :description, :picture, :user_id)
  end
end
