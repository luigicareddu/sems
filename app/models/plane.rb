class Plane < ActiveRecord::Base
	enum state: [:operative, :inoperative]
	has_many :notes

	validates :name, :ac_type, :state, presence: true
	validates :name, uniqueness: { case_sensitive: false }
end
