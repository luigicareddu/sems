class Note < ActiveRecord::Base
	enum state: [:open, :closed]
	belongs_to :plane
	belongs_to :user
	has_many :items, dependent: :destroy

	#define a scope for open notes
	scope :open, -> { where(state: 'open') }

	def self.search(search)
	  if search
	  	searched = "%#{search}%"
	    # search de search text in planes.name OR note.title
	    joins(:plane).where('planes.name LIKE ? OR title LIKE ?', searched, searched)
	  else
	    all
	  end
	end



end
