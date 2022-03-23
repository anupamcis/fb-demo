class RemoveCommentCountFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :comment_count, :integer
  end
end
