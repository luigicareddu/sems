class Note < ActiveRecord::Base
	enum state: [:open, :closed]
	belongs_to :plane
	belongs_to :user
	has_many :items, dependent: :destroy

	scope :open, -> { where(state: 'open') }

	def self.search(search)
	  if search
	  	searched = "%#{search}%"
	    joins(:plane).where('planes.name LIKE ? OR title LIKE ?', searched, searched)
	  else
	    all
	  end
	end



end
