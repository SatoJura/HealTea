class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  attachment :profile_image

  validates :nickname, length: { in: 2..10 },
                       uniqueness: true
end
