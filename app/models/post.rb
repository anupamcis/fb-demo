class Post < ApplicationRecord
  belongs_to :user 
  has_many :comments,dependent: :delete_all
  # has_one_attached :image, as: :imageable
  has_many :likes
  mount_uploader :image, CoverUploader
end
