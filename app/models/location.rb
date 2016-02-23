class Location < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	acts_as_votable
end
