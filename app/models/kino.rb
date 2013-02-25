class Kino < ActiveRecord::Base
	has_many :film

	acts_as_gmappable :process_geocoding => false
  
  attr_accessible :nazwa, :szerokosc, :dlugosc
end
