class CreateArtistTracks < ActiveRecord::Migration
  def change
    create_table :artist_tracks do |t|
      t.integer :track_id
      t.integer :artist_id

      t.timestamps null: false
    end
  end
end
