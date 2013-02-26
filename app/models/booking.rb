class Booking < ActiveRecord::Base
	belongs_to :projection

  	attr_accessible :termin, :imie, :nazwisko, :email, :numer, :bilety_normalne, :bilety_ulgowe, :projection_id
	
	# sprawdzanie poprawności wprowadzanych danych
	validates_format_of :imie, :with => /\A[a-zA-Z]+\z/,  :message => "Please use only regular letters as username"
	validates_format_of :nazwisko, :with => /\A[a-zA-Z]+\z/,  :message => "Please use only regular letters as username"
	validates :imie, :presence => true
	validates :nazwisko, :presence => true
	validates :termin, :presence => true
	validates :email, :presence => true, :length => {:minimum => 3, :maximum => 254} #, :uniqueness => true
	validates :projection_id, :presence => true
	
end
