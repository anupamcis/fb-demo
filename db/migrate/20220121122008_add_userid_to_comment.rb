class AddUseridToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :userid, :integer
  end
end
