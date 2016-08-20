class Location < ActiveRecord::Base
  belongs_to :trip
  has_many :restaurants, dependent: :delete_all
end
