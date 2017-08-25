class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "Post Created!"
    else
      @errors = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path(@post), notice: "Post Updated!"
    else
      @errors = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy
    redirect_to posts_path, notice: "Deleted Post: #{post.title}"
  end

  private

  def post_params
    params.require(:post).permit(:title, :course, :content)
  end
end
