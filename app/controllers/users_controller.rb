class UsersController < ApplicationController

  before_action :get_friends, only: [:index, :show, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:profile_description, :email, :avatar)
  end

  def get_friends
    @friends = Friend.all
  end

end
