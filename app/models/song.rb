class Song < ActiveRecord::Base
  attr_accessible :album, :artist, :name
end
