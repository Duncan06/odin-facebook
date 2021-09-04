module Commentable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @commentable
    else
      flash[:notice] = "Unable to submit comment."
    end

    redirect_back fallback_location: posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end

end
