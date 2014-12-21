class Plane < ActiveRecord::Base
	enum state: [:operative, :inoperative]
	has_many :notes
end
