class AddGroupIdToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :group_id, :int
  end
end
