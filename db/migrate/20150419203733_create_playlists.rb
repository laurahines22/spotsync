class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.integer :owner_id
      t.integer :duration_s

      t.timestamps null: false
    end
  end
end
