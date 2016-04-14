require 'securerandom'

class User < ActiveRecord::Base
  include Clearance::User
  has_many :authentications, :dependent => :destroy
  has_many :listings
  has_one :profile
  has_many :reservations

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      # u.first_name = auth_hash["info"]["first_name"]
      u.password = SecureRandom.hex(3)
      # u.encrypted_password = [*('A'..'Z')].sample(8).join
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end
end
