class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts ,dependent: :delete_all
  has_one :image, as: :imageable

  mount_uploader :image, CoverUploader
end
