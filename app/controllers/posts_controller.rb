class PostsController < ApplicationController
  def index
    if params[:user_id]
      # Fetch posts associated with a specific user
      @user = User.find(params[:user_id])
      @posts = @user.posts
    else
      # Fetch all posts
      @posts = Post.all
    end
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  rescue ActiveRecord::RecordNotFound
    render plain: "Post not found", status: :not_found
  end
end