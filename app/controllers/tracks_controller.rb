class TracksController < ApplicationController

  def search
    results = RSpotify::Track.search(search_params[:q], limit: 1, market: 'US')
    results.each do |track|
      t = Track.build({:spotify_id => track.id, :name => track.name, :uri => track.uri, :preview_url => track.preview_url, :duration_s => track.duration_ms/1000})
      t.artist = Artist.find_or_build_artist(track.artists.first)
      #refactor
      t.build_album({:spotify_id => track.album.id, :name => track.album.name, :uri => track.album.uri, :image_url => track.album.images.first["url"]})
      t.save
    end
    binding.pry
  end

  def add_to_playlist
  end

  private
  def search_params
    params.permit(:q) 
  end  
end
