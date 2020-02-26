class AddCommentIdToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :comment_id, :int
  end
end
