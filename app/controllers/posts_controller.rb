class PostsController < ApplicationController
  def index
    @posts = current_user.posts
  end

  def get_all
    @posts = Post.all
  end

  def save
    @posts = Post.all
    if params[:moderation]
      post = Post.find_by(id: params[:moderation].to_f)
      post.moderation = true
      post.save
    elsif params[:moderation_hidden]
      post = Post.find_by(id: params[:moderation_hidden].to_f)
      post.moderation = false
      post.save
    end
    render 'get_all'
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end