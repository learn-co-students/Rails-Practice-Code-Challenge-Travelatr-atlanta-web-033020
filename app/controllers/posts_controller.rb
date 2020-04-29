class PostsController < ApplicationController
  
  def show
    @post = find_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = find_post
  end
  
  def update
    byebug
    @post = find_post
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def like
    @post = Post.find_by(id: params[:id])
    @post.like_post
    render :show
  end
  
  private
  def find_post
    Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:blogger_id, :destination_id, :title, :content)
  end
  
end
