class Post < ApplicationRecord
  belongs_to :user 
  has_many :comments,dependent: :delete_all
  has_many :likes
  mount_uploader :image, CoverUploader
  # scope :posts, ->{where(text: "Jindagi mast ")}
  # scope :postsid, ->{where(id:42)}
end
