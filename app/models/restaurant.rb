class Restaurant < ActiveRecord::Base
	belongs_to :location
	has_one :trip, :through => :location
end
