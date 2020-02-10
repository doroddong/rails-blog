class PostsController < ApplicationController
  before_action :load_post, only: [:show,:edit,:update,:destroy, :toggle_like]
  before_action :authenticate_user!

  
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

  def toggle_like
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    @like ? @like.destroy : current_user.likes.create(post_id: @post.id)
  end

  def ajax_test
    puts 'aaaaaaaaa'
    puts params[:ajax_test]
  end 

  private
  def post_params
    params.require(:post).permit(:title,:description,:user_id,:image)
  end

  private
  def load_post
    @post = Post.find_by(id: params[:id])
  end

  def load_object
    @object = Item.find params[:id]
  end
end