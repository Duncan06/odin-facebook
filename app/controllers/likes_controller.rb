class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.user_id = current_user.id 
    @like.save

    flash[:notice] = "Like submitted"

    redirect_back fallback_location: posts_url
  end

  def destroy
  end

  private

  def like_params
    params.permit(:post_id)
  end

end
