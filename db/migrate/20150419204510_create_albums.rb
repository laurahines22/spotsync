class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :spotify_id
      t.string :name
      t.string :uri
      t.string :image_url
      t.integer :artist_id

      t.timestamps null: false
    end
  end
end
