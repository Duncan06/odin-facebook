class CommentsController < ApplicationController
    
  def create
    @post = Post.find(params[:post_id])
    
    user = User.find(id: current_user.id)
    name = user.email[/[^@]+/]

    @post.comments.create(author: name, body: params[:body])

    flash[:notice] = "Comment created!"

    redirect_back fallback_location: posts_url
  end
  
end
