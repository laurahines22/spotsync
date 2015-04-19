class Track < ActiveRecord::Base
  has_many :playlist_tracks
  has_many :playlists, :through => :playlist_tracks
  has_many :artist_tracks
  has_many :artists, :through => :artist_tracks
  belongs_to :album
end
