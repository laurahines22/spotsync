class TracksController < ApplicationController

  def search
    results = RSpotify::Track.search(search_params[:q], limit: 5, market: 'US')
    @search_results = results.collect do |track|
      t = Track.find_or_build_track(track)
      t.artist = Artist.find_or_build_artist(track.artists.first)
      t.album = Album.find_or_build_album(track.album)
      t.save
      t
    end
    @playlist = Playlist.find(params["playlist_id"])
  end

  def add_to_playlist
  end

  private
  def search_params
    params.permit(:q) 
  end  
end
