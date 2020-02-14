class CommentsController < ApplicationController
  before_action :load_post, only: [:create,:destroy]


  def create
    @comment = Comment.create comment_params
    
    redirect_to post_path(@comment.post_id)
    #render 'create.js', locals:{comment:@comments}

  end

  def destroy
    @comment.destroy
  end

  def new
    @comment = Comment.new
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:post_id,:user_id)
  end

  private
  def load_post
    @post = Post.find_by(id:params[:id])
  end

  ##def load_comment
  #  @comment = Comment.find_by(id??)
  #end

end
