require 'geocoder'

class Kino < ActiveRecord::Base
	has_many :film
  
  attr_accessible :nazwa, :szerokosc, :dlugosc

  def self.posortowane_po_odleglosci(szer,dlu)
  	kina = []
  	Kino.all.each do |kino|
  		kina << [kino.odleglosc_od(szer,dlu), kino]
  	end
  	kina.sort {|a,b| a[0] <=> b[0]}
  end

  def adres
  	#wyniki nie są zadowalające
  	Geocoder.search([szerokosc, dlugosc])[0].address
  end

  def odleglosc_od(szer, dlu)
  	Geocoder::Calculations.distance_between([szer,dlu], [szerokosc, dlugosc], :unit => :km)
  end
end
