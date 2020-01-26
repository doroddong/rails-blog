class PostsController < ApplicationController
  before_action :load_post, only: [:show,:edit,:update,:destroy]


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
    @post.title = params[:post][:title]
    @post.description = params[:post][:description]
    @post.save

    redirect_to posts_path
  end
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title,:description)
    end
  private
  def load_post
    @post = Post.find_by(id: params[:id])
  end
end
