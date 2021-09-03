class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])

    if !already_liked?
      @post.likes.create(user_id: current_user.id)
    else
      flash[:notice] = "You have already liked this posting."
    end

    flash[:notice] = "Like submitted"

    redirect_back fallback_location: posts_url
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    flash[:notice] = "Unlike submitted"

    redirect_back fallback_location: posts_url
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

end
