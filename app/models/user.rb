class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  # :registerable削除
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  has_many :posts
end
