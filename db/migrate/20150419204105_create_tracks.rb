class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :spotify_id
      t.string :name
      t.string :uri
      t.string :preview_url
      t.integer :album_id
      t.integer :duration_s

      t.timestamps null: false
    end
  end
end
