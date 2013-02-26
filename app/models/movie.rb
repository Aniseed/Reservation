class Movie < ActiveRecord::Base
	belongs_to :cinema
	has_many :projections
  
  attr_accessible :tytul, :rok, :cinema_id

	validates :tytul, :presence => true
	validates :rok, :presence => true
	validates :cinema_id, :presence => true
	validates_numericality_of   :rok, :only_integer => true   
	validates_numericality_of   :cinema_id, :only_integer => true   

end
