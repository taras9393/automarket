class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 6)
  end

  def show

  end
end
