class Album < ActiveRecord::Base
  has_many :tracks
  has_many :artists, :through => :tracks

  def self.find_or_build_album(album)
    self.find_by(:spotify_id => album.id) || self.new({:spotify_id => album.id, :name => album.name, :uri => album.uri})
  end
end
