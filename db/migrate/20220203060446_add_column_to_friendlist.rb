class AddColumnToFriendlist < ActiveRecord::Migration[7.0]
  def change
    add_column :friendlists, :friendship_status, :string
  end
end
