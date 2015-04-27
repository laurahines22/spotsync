class Track < ActiveRecord::Base
  has_many :playlist_tracks
  has_many :playlists, :through => :playlist_tracks
  belongs_to :artist
  belongs_to :album

  validates :spotify_id, :uniqueness => true

  def self.find_or_build_track(track)
    self.find_by(:spotify_id => track.id) || self.new({:spotify_id => track.id, :name => track.name, :uri => track.uri, :preview_url => track.preview_url, :duration_s => track.duration_ms/1000})
  end
end