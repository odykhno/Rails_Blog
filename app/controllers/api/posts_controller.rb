module Api
  class PostsController < ApplicationController
    respond_to :json

    before_action :authenticate!

    def index
      @posts = Post.all.includes(:comments, :user).order('created_at desc')
      render :index
    end

    def show
      @post = Post.friendly.find(params[:id])
      @comments = @post.order_comments
      render :show
    end

    def create
      @post.save
      redirect_to post_path(@post)
    end

    def update
      @post.update(post_params)
      redirect_to post_path(@post)
    end

    def destroy
      @post.destroy
      redirect_to posts_path
    end

    private
    def post_params
      params.require(:post).permit(:title, :text, :all_tags)
    end
  end
end
