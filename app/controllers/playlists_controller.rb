class PlaylistsController < ApplicationController
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
    @playlist = Playlist.find(params["id"])
  end

  def edit
    @playlist = Playlist.find(params["id"])
  end

  def update
    @playlist = Playlist.find(params["id"])
    @playlist.update(playlist_params)
    redirect_to playlist_path(@playlist)
  end

  def destroy
  end

  private
  def playlist_params
    params.require(:playlist).permit(:name)
  end

end
