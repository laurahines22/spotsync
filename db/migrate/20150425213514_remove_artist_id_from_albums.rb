class RemoveArtistIdFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :artist_id, :integer
  end
end
