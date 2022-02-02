class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t| 
      t.string :text 
      t.references :post, optional: true, foreign_key: true 
      t.references :coment, foreign_key: { to_table: :comments }
      t.timestamps
    end
  end
end
