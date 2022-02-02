class AddWorkAtToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :work_at, :string
  end
end
