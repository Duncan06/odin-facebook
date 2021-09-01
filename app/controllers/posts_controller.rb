class PostsController < ApplicationController

  include PostsHelper

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator_id = current_user.id
    @post.save

    flash[:notice] = "Post created!"

    redirect_to action: :index
  end


  private

  def post_params
    params.require(:post).permit(:body)
  end
    
end
