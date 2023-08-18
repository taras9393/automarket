class BicyclesController < ApplicationController

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
    @bike.destroy
    redirect_to bicycles_path
  end

  def index
    @bikes = Bicycle.all
  end

  def show
    @bike = Bicycle.find(params[:id])
  end

  def bicycle_params
    params.require(:bicycle).permit(:name, :description, :picture, :user_id)
  end
end
