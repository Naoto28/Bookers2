class PostsController < ApplicationController

before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]

  def index
      @posts = Post.all
      @post = Post.new
  end

  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save
       redirect_to post_path(@post)
      end
  end

  def show
      @postf = Post.new
      @post = Post.find(params[:id])
      @user = @post.user
  end

  def top
  end

  def edit
      @post = Post.find(params[:id])
      if @post.user_id == current_user.id
      else
         redirect_to user_path(current_user)
      end
  end

  def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to post_path(@post)
  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
  end

  private

  def post_params
      params.require(:post).permit(:title, :opinion)
  end

end
