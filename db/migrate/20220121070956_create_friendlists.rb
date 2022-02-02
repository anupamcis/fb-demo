class CreateFriendlists < ActiveRecord::Migration[7.0]
  def change
    create_table :friendlists do |t|
      t.integer :current_user_id
      t.integer :friends_id

      t.timestamps
    end
  end
end
