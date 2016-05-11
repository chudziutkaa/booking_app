class Price < ActiveRecord::Base
	belongs_to :hotel
	belongs_to :room

	validates :name, inclusion: { in: %w(Single Double Twin Apartament), message: "Check name" }
	validates :price, presence: true
end