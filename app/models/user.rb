class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :token_authenticatable

  has_one_attached :avatar
  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services
  
  before_save :ensure_authentication_token
end
