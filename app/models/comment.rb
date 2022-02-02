class Comment < ApplicationRecord
  belongs_to :post, optional: true
  has_many :replies, class_name: "Comment",foreign_key: "coment_id",dependent: :delete_all
  belongs_to :coment, class_name: "Comment", optional: true
end
