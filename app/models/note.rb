class Note < ActiveRecord::Base
	enum state: [:open, :closed]
	belongs_to :plane
end
