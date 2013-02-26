class Projection < ActiveRecord::Base
	belongs_to :movie
	has_many :bookings
  
  	attr_accessible :data, :godzina, :movie_id
	
	validates :data, :presence => true
	validates :godzina, :presence => true
	validates :movie_id, :presence => true

end
