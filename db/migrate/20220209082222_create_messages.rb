class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :friends_id
      t.string :text

      t.timestamps
    end
  end
end
