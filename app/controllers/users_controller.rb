class UsersController < ApplicationController

  before_action :get_friends, only: [:index, :show, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(creator_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.avatar != nil
      @user.avatar.purge
    end
    @user.avatar.attach(user_params[:avatar])

    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:notice] = "User deleted!"

    redirect_to new_user_session_path
  end

  private

  def user_params
    params.require(:user).permit(:profile_description, :avatar)
  end

  def get_friends
    @friends = Friend.all
  end

end
