class CategoriesController < ApplicationController

 def index
   @catgs = Category.all
 end

 def show
   @catg = Category.find(params[:id])
   @bikes = @catg.bicycles.paginate(page: params[:page], per_page: 4)
 end

  def new
    @catg = Category.new
  end

  def create
    @catg = Category.new(category_params)
    if @catg.save
      redirect_to categories_path, notice: "You add new category!!"
    else
      render 'new'
    end
  end


  def edit
    @catg = Category.find(params[:id])

  end

  def update
    @catg = Category.find(params[:id])
    if @catg.update_attributes(category_params)
      redirect_to categories_path, notice: "Succesfull update"
    else
      render 'edit'
    end
  end


  def destroy
    @catg = Category.find(params[:id])
    @catg.destroy
    redirect_to categories_path, notice: "Nice destroy"
  end


private

  def category_params
    params.require(:category).permit(:name)
  end

end
