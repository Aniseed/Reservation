class Movie < ActiveRecord::Base
	belongs_to :cinema
	has_many :projections
  
  attr_accessible :tytul, :rok, :cinema_id
end