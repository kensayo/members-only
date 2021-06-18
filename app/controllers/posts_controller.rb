class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @post = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def new
    @post = Post.new
    @user = current_user
  end

  private

  def post_params
    params.require(:post).permit(:body, :title, :user_id)
  end
end
