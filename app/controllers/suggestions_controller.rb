class SuggestionsController < ApplicationController

  before_action :authenticate_user!

  def index
    @sugs = Suggestion.all
  end

  def show
    @sug = Suggestion.find(params[:id])
  end

  def new
    @bike = Bicycle.find(params[:bicycle_id])
    @sug = Suggestion.new
  end

  def create
    @bike = Bicycle.find(params[:bicycle_id])
    @sug = @bike.suggestions.new(suggestion_params)
    if @sug.save
      redirect_to bicycle_path(@bike.id), notice: 'Suggestion was successfully create'
    else
      render 'new'
    end
  end

  def destroy
    @bike = Bicycle.find(params[:bicycle_id])
    @sug = @bike.suggestions.find(params[:id])
      if can? :destroy, @sug
    @sug.destroy
    redirect_to bicycle_path(@bike.id), notice: "Nice destroy"
      else
    redirect_to root_path, alert: "You have not right"
      end
  end

  def accept

    @bike = Bicycle.find(params[:bicycle_id])
    @sug = @bike.suggestions.find(params[:id])
    @bike.update_attributes(name: @sug.name, description: @sug.description, picture: @sug.picture)




  #@bike.name = @sug.name
  #@bike.description = @sug.description
  #@bike.picture = @sug.picture
  #if @bike.save
  redirect_to bicycle_path(@bike.id), notice: "Nice change"



  end



  private
  def suggestion_params
    params.require(:suggestion).permit(:name, :description, :picture, :bicycle_id)
  end

end
