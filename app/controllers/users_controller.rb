class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 6)
  end

  def show
    @user_bikes = current_user.bicycles.paginate(page: params[:page], per_page: 3)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

end
