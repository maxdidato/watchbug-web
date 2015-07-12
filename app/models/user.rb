require 'bcrypt'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable,  :trackable, :validatable, :rememberable
  validates :email, email_format:{message:'wrong format'}, uniqueness: true
  validates :password, presence:true, length: {minimum: 6}
  validates :username,presence:true,length:{minimum:4}, format:{ with: /\A[a-zA-Z0-9]+\Z/ ,message:'can only contain letters and numbers'}
  devise :database_authenticatable, :registerable

end
