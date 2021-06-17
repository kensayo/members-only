class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]

  def index

  end

  def create
    @post = Post.new (post_params)
  end

  def new
    @post = Post.new
  end

  private
  def check_login
    puts "checking login"
  end

  def post_params
    params.require(:post).permit(:body, :title)
  end
end
