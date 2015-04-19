class CreatePlaylistTracks < ActiveRecord::Migration
  def change
    create_table :playlist_tracks do |t|
      t.integer :playlist_id
      t.integer :track_id
      t.boolean :played
      t.integer :order_num

      t.timestamps null: false
    end
  end
end
