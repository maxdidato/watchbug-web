require 'bcrypt'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable,  :trackable, :validatable, :rememberable
  validates :email, email_format: {message: 'wrong format'}, uniqueness: true, :on => :create
  validates :password, presence: true, length: {minimum: 6}, :on => :create
  validates :username, allow_blank: true, length: {minimum: 4}, format: {with: /\A[a-zA-Z0-9]+\Z/, message: 'can only contain letters and numbers'}
  devise :database_authenticatable, :registerable

  def geolocation
    response=HTTParty.get("#{Settings.watchbug_api}/geolocations/#{watchbug_id}").body
    JSON.parse(response,symbolize_names:true)
  end
end
