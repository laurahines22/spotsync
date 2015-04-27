class PlaylistTracksController < ApplicationController
  def destroy
     @playlist_track = PlaylistTrack.find(params["id"])
     @playlist_track.destroy
     redirect_to playlist_path(@playlist_track.playlist)
  end
end
