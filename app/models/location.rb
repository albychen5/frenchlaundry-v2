class Location < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true

	# adding header image for locations, paperclip gem
	has_attached_file :header_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default-location.jpg"
  validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\Z/

	# Location can be voted on
	acts_as_votable
end
