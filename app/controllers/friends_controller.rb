class FriendsController < ApplicationController
  def create
    @friend = Friend.new(friend_params)

    if @friend.save
      @friend.invited!
      flash.now[:notice] = "Friend invite sent!"
    else
      flash.now[:alert] = "Friend invite could not be sent."
    end

  end

  def update
    @friend = Friend.find(params[:id])

    if @friend && @friend.invited?
      @friend.accepted!
      flash.now[:notice] = "Friend invite accepted!"
    else
      flash.now[:notice] = "Not sent friend invite."
    end

  end

  def destroy
    @friend = Friend.find(params[:id])

    @friend.destroy
  end

  private

  def friend_params
    params.permit(:user_id)
  end

end
