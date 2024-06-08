class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups
  has_many :chats, dependent: :destroy
end
