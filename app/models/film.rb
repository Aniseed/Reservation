class Film < ActiveRecord::Base
	belongs_to :kino
  
  attr_accessible :tytul, :rok
end