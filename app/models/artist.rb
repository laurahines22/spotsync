class Artist < ActiveRecord::Base
  has_many :artist_tracks
  has_many :tracks, :through => :artist_tracks
  has_many :albums
end
