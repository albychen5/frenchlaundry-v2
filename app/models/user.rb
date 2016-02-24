class User < ActiveRecord::Base
	validates :user_name, presence: true, length: { minimum: 2 }
	validates :phone_number, presence: true
	has_attached_file :avatar, styles: { medium: '152 x 152#' }
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	has_many :locations, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
