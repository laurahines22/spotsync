class Album < ActiveRecord::Base
  has_many :tracks
  has_many :artists, :through => :tracks
end
