class CommentsController < ApplicationController
  before_filter :find_commenter

  def create
    @comment = @commenter.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    if @comment.commentable_type == "User"
      redirect_to profile_path(@commenter)
    else
      redirect_to @commenter
    end
  end

private
  def find_commenter
    @klass = params[:commenter_type].constantize
    @commenter = @klass.find(params[:commenter_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end