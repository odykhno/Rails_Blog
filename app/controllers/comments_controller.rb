class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # post_params.merge(user_id: current_user.id)
    @comment = @post.comments.create(comment_params.merge(author: current_user.email))
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
