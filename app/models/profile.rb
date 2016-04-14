class Profile < ActiveRecord::Base
	belongs_to :user
	validates_uniqueness_of :user_id
	mount_uploader :dis_pic, ImageUploader
end
