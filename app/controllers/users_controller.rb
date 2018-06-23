class UsersController < ApplicationController

before_action :authenticate_user!, only:[:index, :show, :edit, :update, :destroy]

  def index
      @users = User.all
      @post = Post.new
  end

  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      @post.save
      redirect_to post_path(@post)
  end

  def show
      @user = User.find(params[:id])
      @post = Post.new

  end

  def edit
    if User.exists?(id: params[:id])
        if current_user.id.to_i == params[:id].to_i
             @user = User.find(params[:id])
         else
             redirect_to user_path(params[:id])
         end

       else
          redirect_to user_path(current_user)
       end
  end

  def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(current_user)
  end

  def destroy
  end

  private

  def post_params
      params.require(:post).permit(:title, :opinion)
  end

  def user_params
      params.require(:user).permit(:name, :introduction, :image)
  end


end
