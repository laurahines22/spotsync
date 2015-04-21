class PlaylistsController < ApplicationController
  def index
    @owned_playlists = current_user.sets
    @contributed_playlists = current_user.playlists
  end

  def new
  end

  def create
  end

  def show
  end

  def udpate
  end

  def destroy
  end
end
