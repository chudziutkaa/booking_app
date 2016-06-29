class Hotel < ActiveRecord::Base
	has_many :rooms
	has_many :orders, through: :rooms
	has_many :comments
	has_many :prices
	has_one :gallery
	has_many :photos, through: :gallery
	belongs_to :owner, class_name: "User"

	validates :name, length: { minimum: 3 }
	validates :standard, inclusion: { in: %w(* ** *** **** *****), message: "If you don't know standard of your hotel it would be better if you closed it :(" }
	validates :description, length: { in: 20..800 }
	validates :location, length: { minimum: 5 }

	def self.browse(search)
		if search
			Hotel.where('location LIKE ?', "%#{search}%")
		else
			Hotel.all
		end
	end
end