class FriendsController < ApplicationController
  def create
    @friend = Friend.new(friend_params)

    if @friend.save
      @friend.invited!
      flash[:notice] = "Friend invite sent!"
    else
      flash[:alert] = "Friend invite could not be sent."
    end

    redirect_to root_path
  end

  def update
    @friend = Friend.find(params[:id])

    if @friend && @friend.invited?
      @friend.accepted!
      flash[:notice] = "Friend invite accepted!"
    else
      flash[:notice] = "Not sent friend invite."
    end

    redirect_to root_path
  end

  def destroy
    @friend = Friend.find(params[:id])

    @friend.destroy

    redirect_to root_path
  end

  private

  def friend_params
    params.permit(:user_id, :creator_id)
  end

end
