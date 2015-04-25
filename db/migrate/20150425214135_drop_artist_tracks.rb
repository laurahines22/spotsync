class DropArtistTracks < ActiveRecord::Migration
  def change
    drop_table :artist_tracks
  end
end
