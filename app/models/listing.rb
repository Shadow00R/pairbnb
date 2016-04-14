class Listing < ActiveRecord::Base
	belongs_to :user
	# has_many :reservations, :dependent => :destroy
	mount_uploaders :pictures, PictureUploader
	# validates_presence_of :price
end
