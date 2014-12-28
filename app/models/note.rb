class Note < ActiveRecord::Base
	enum state: [:open, :closed]
	belongs_to :plane
	belongs_to :user
	has_many :items, dependent: :destroy

end
