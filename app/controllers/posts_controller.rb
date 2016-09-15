class PostsController < ApplicationController
  before_action :if_blocked_user

  def index
   @posts = current_user.posts.paginate(page: params[:page], per_page: 3)
  end

  def get_all
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 3)
    else
      @posts = Post.all.paginate(page: params[:page], per_page: 3)
    end
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
    redirect_to get_all_posts_path
  end

  def show
    @post = Post.find(params[:id])
    @comments = []
    if @post.moderation == true
      @post.comments.where(approved: true).each do |comment|
        @comments << comment
      end
    else
      @comments = @post.order_comments
    end
    @comments = @comments.paginate(page: params[:page], per_page: 3)
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
    params.require(:post).permit(:title, :text, :all_tags)
  end
end