class Room < ActiveRecord::Base
	belongs_to :hotel
	has_many :orders
	has_one :price

	validates :name, inclusion: { in: %w(Single Double Twin Apartament), message: "Check name" }
end