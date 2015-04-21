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
  end

  def udpate
  end

  def destroy
  end

  private
  def playlist_params
    params.require(:playlist).permit(:name)
  end

end
