class AddForeignKeysToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :album_id, :integer
    add_column :tracks, :artist_id, :integer 
  end
end
