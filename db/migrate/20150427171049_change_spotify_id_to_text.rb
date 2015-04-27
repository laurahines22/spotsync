class ChangeSpotifyIdToText < ActiveRecord::Migration
  def change
    change_column :tracks, :spotify_id, :string
    change_column :artists, :spotify_id, :string
    change_column :albums, :spotify_id, :string
  end
end
