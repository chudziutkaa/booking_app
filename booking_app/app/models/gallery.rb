class Gallery < ActiveRecord::Base
	belongs_to :hotel
	has_many :photos

	accepts_nested_attributes_for :photos
end