class Comment < ApplicationRecord
  belongs_to :post, optional: true
  has_many :replies, class_name: "Comment",foreign_key: "coment_id",dependent: :delete_all
  belongs_to :coment, class_name: "Comment", optional: true
  
  
  # after_save :comments
  # private
  # def comments
  #   if text == ""
  #     Comment.last.delete
  #   end
  # end
  
  
  # before_destroy :comment
  # private
  # def comment
  #   if text == "anu"
  #     Comment.create(text:"anupam",userid:userid,post_id:post_id)
  #   end
  # end 
  
end
