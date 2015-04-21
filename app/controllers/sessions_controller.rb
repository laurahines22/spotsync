class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    login(@user)
    redirect_to playlists_path
  end

  def destroy
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
