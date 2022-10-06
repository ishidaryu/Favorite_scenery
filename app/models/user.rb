class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :favorites, dependent: :destroy
 has_many :sceneries, dependent: :destroy
 has_many :scenery_comments, dependent: :destroy
end
