class Film < ActiveRecord::Base
	belongs_to :kino
	has_many :projekcja
  
  attr_accessible :tytul, :rok, :kino_id
end