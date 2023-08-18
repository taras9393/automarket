class StatpagesController < ApplicationController
  def home
  end

  def test
    @users = User.all
  end


end
