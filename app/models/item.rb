class Item < ActiveRecord::Base
	belongs_to :note, touch: true
	belongs_to :user
end
