require 'geocoder'

class Cinema < ActiveRecord::Base
	has_many :movies
  
  attr_accessible :nazwa, :szerokosc, :dlugosc

	validates :nazwa, :presence => true
	validates :szerokosc, :presence => true
	validates :dlugosc, :presence => true 
	#validates_numericality_of   :dlugosc, :only_integer => true   
	#validates_numericality_of   :szerokosc, :only_integer => true   

  def self.posortowane_po_odleglosci(szer,dlu)
  	cinemas = []
  	Cinema.all.each do |cinema|
  		cinemas << [cinema.odleglosc_od(szer,dlu), cinema]
  	end
  	cinemas.sort {|a,b| a[0] <=> b[0]}
  end

  def adres
  	#wyniki nie są zadowalające
  	Geocoder.search([szerokosc, dlugosc])[0].address
  end

  def odleglosc_od(szer, dlu)
  	Geocoder::Calculations.distance_between([szer,dlu], [szerokosc, dlugosc], :unit => :km)
  end
end
