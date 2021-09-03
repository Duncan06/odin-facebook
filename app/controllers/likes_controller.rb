class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.user_id = current_user.id 
    @like.save

    flash[:notice] = "Like submitted"

    redirect_back fallback_location: posts_url
  end

  def destroy
    @like = Like.where(post_id: params[post_id], user_id: params[user_id])
    @like.destroy

    flash[:notice] = "Unlike submitted"

    redirect_back fallback_location: posts_url
  end

  private

  def like_params
    params.permit(:post_id)
  end

end
