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
    @post = Post.find_by(id: params[:id])
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:post][:title]
    @post.description = params[:post][:description]
    @post.save

    redirect_to posts_path
  end
  def destroy

  end

  private
    def post_params
      params.require(:post).permit(:title,:description)
    end
  private
    def edit_params
      params.require(:patch).permit(:title,:description)
    end
end
