class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.integer :spotify_id
      t.string :name
      t.string :uri

      t.timestamps null: false
    end
  end
end
