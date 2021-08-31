class UsersController < ApplicationController
  def index
    @users = User.all 
    @friends = Friend.all
  end

  def show
  end

end
