class CommentsController < ApplicationController
  before_action :load_post, only: [:create,:destroy,:edit,:update]
  before_action :load_comment, only: [:destroy,:edit,:update]

  def create
    @comment = Comment.create comment_params
    
    render 'create.js', locals:{comment:@comment}
  end

  def destroy
    @comment.destroy
    render 'destroy.js',locals:{comment:@comment}
  end

  def new
    @comment = Comment.new
  end

  def edit
    render 'edit.js', locals:{comment:@comment}
  end

  def update
    
    @comment.content = params[:comment][:content]
    @comment.user_id = current_user.id
    @comment.save
    render 'update.js', locals:{comment:@comment}
  end


  private
  def comment_params
    params.require(:comment).permit(:content,:post_id,:user_id)
  end

  private
  def load_post
    @post = Post.find_by(id:params[:id])
  end

  private
  def load_comment
    @comment = Comment.find params[:id]
  end
  
end
