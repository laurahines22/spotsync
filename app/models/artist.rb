class Artist < ActiveRecord::Base
  has_many :tracks
  has_many :albums, :through => :tracks

  def self.find_or_build_artist(artist)
    self.find_by(:spotify_id => artist.id) || self.build({:spotify_id => artist.id, :name => artist.name, :uri => artist.uri})
  end
end
