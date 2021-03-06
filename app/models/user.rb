class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friends, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy


  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver
  end
end
