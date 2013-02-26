class Kino < ActiveRecord::Base
	has_many :film
  
  attr_accessible :nazwa, :szerokosc, :dlugosc

  def self.posortowane_po_odleglosci(szer,dlu)
  	kina = []
  	Kino.all.each do |k|
  		kina << [k.odleglosc_od(szer,dlu), k]
  	end
  	kina.sort
  end

  def adres
  	Geocoder.search(self.szerokosc, self.dlugosc)[0].address
  end

  def odleglosc_od(szer, dlu)
  	Geocoder::Calculations.distance_between([szer,dlu], [szerokosc, dlugosc])
  end
end
