class PostsController < ApplicationController
    
  def index
    @post = Post.all
  end

  def create
    @post = Post.create post_params
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end
  def edit

  end
  def show

  end
  def update

  end
  def destroy

  end

  private
    def post_params
      params.require(:post).permit(:title,:description)
    end
end
