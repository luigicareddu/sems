class Note < ActiveRecord::Base
	enum state: [:open, :closed]
	belongs_to :plane
	has_many :items
end
