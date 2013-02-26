class Projekcja < ActiveRecord::Base
	belongs_to :film
	has_many :rezerwacja
  
  attr_accessible :data, :godzina
end
