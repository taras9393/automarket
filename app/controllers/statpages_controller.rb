class StatpagesController < ApplicationController
  def home
    @bikes = Bicycle.paginate(page: params[:page], per_page: 4)
    @bike = Bicycle.all
  end

  def test

  end

  def contacts
  end

  def history
  end

  def price

  end

end
