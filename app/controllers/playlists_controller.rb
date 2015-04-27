class PlaylistsController < ApplicationController

  before_action :find_playlist, only: [:show, :edit, :update, :destroy]

  def index
    @sets = current_user.sets
    @playlists = current_user.playlists
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.owner = current_user
    if @playlist.save 
      redirect_to playlist_path(@playlist)
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if playlist_params.include?(:name)
      @playlist.update(playlist_params)
    else
      @track = Track.find(playlist_params["track_ids"])
      @playlist_track = @playlist.add_track(@track, current_user)
      @playlist_track.save
    end
    redirect_to playlist_path(@playlist)
  end

  def destroy
    @playlist.destroy
    redirect_to playlists_path
  end

  private
  def playlist_params
    params.require(:playlist).permit(:name, :track_ids)
  end

  def find_playlist
    @playlist = Playlist.find(params["id"])
  end

end
