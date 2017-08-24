class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "Post Created!"
    else
      @errors = @post.errors.full_messages
      puts @errors
      render :new
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy
    redirect_to posts_path, notice: "Deleted Post: #{post.title}"
  end

  private

  def post_params
    params.require(:post).permit(:title, :course, :content, :user)
  end
end
