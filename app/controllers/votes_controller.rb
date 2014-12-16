class VotesController < ApplicationController
  def create
    klass = params[:content_type].constantize
    @content = klass.find(params[:content_id])
    @vote = @content.votes.create(user: current_user)
    respond_to do |format|
      format.html do
        redirect_to @content
      end
      format.js
    end
  end

  def destroy
    vote = Vote.find params[:id]
    @content = vote.content
    vote.destroy
    respond_to do |format|
      format.html do
        redirect_to @content
      end
      format.js
    end
  end
end
