class Location < ActiveRecord::Base
  belongs_to :trip
  has_many :restaurants
end
