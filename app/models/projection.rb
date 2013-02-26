class Projection < ActiveRecord::Base
	belongs_to :movie
	has_many :bookings
  
  attr_accessible :data, :godzina, :movie_id
end
