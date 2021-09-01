class PostsController < ApplicationController

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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    flash[:notice] - "Post updated!"

    redirect_to action: :index
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    flash[:notice] = "Post deleted!"

    redirect_to action: :index
  end


  private

  def post_params
    params.permit(:body)
  end
    
end
