module FriendsHelper
  def friend_params
    params.permit(:user_id, :creator_id)
  end
end
