class Booking < ActiveRecord::Base
	belongs_to :projection

  attr_accessible :termin, :imie, :nazwisko, :email, :numer, :bilety_normalne, :bilety_ulgowe, :projection_id
end
