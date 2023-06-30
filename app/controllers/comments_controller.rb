class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(author_id: current_user.id, post_id: params[:post_id], **comment_params)

    if @comment.save
      flash[:notice] = 'Your comment added successfully'
      redirect_to "/users/#{current_user.id}/posts/#{params[:post_id]}"
    else
      flash[:alert] = 'Opps, something went wrong, try again!'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
