class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
      # before_validation :login, :email, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :posts ,dependent: :delete_all

  mount_uploader :image, CoverUploader
  def self.from_google(email:, full_name:, uid:, avatar_url:)
    user = create_with( name: full_name, image: avatar_url, password: 12345678).find_or_create_by!(email: email)
  end
end
