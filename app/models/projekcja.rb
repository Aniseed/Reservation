class Projekcja < ActiveRecord::Base
	belongs_to :film
  
  attr_accessible :data, :godzina
end
