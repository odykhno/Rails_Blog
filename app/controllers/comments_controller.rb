class CommentsController < ApplicationController
  before_action :find_not_approved_comments, :only => [:show, :save]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(author: current_user.email))
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def show
  end

  def save
    if params[:approved]
      comment = Comment.find_by(id: params[:approved].to_f)
      comment.approved = true
      comment.save
    elsif params[:approved_hidden]
      comment = Comment.find_by(id: params[:approved_hidden].to_f)
      comment.approved = false
      comment.save
    end
    redirect_to comments_show_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_not_approved_comments
    @comments = []
    posts = Post.where(moderation: true)
    unless posts.nil?
      posts.each do |post|
        post.comments.where(approved: false).each do |comment|
          @comments << comment
        end
      end
    end
    @comments
  end
end
