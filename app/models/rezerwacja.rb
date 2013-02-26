class Rezerwacja < ActiveRecord::Base
	belongs_to :projekcja

  attr_accessible :termin, :imie, :nazwisko, :email, :numer, :bilety_normalne, :bilety_ulgowe, :projekcja_id
end
