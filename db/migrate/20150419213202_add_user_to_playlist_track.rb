class AddUserToPlaylistTrack < ActiveRecord::Migration
  def change
    add_column :playlist_tracks, :user_id, :integer
  end
end
