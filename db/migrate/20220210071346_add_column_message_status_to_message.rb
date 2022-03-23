class AddColumnMessageStatusToMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :message_status, :string,default:"false"
  end
end
