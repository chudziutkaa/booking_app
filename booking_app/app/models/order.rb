class Order < ActiveRecord::Base
	belongs_to :room
	has_one :hotel, through: :room

	validates :room,  presence: true
end