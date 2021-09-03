class CommentsController < ApplicationController
    
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]

    @comment.save

    flash[:notice] = "Comment created!"

    redirect_back fallback_location: posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
