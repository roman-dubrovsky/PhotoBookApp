class CommentsController < ApplicationController
  before_filter :find_commenter, only: :create

  def create
    @comment = @commenter.comments.build(comment_params)
    if @comment.save
      respond_to do |format|
        format.html do
          if @comment.commentable_type == "User"
            render profile_path(@commenter)
          else
            redirect_to @commenter
          end
        end
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @content = @comment.commentable
    if current_user = @comment.user
      @comment.destroy
      respond_to do |format|
        format.html do
          if @comment.commentable_type == "User"
            redirect_to profile_path(@commenter)
          else
            redirect_to @commenter
          end
        end
        format.js
      end
    end
  end

private
  def find_commenter
    @klass = params[:commenter_type].constantize
    @commenter = @klass.find(params[:commenter_id])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end