module PlaylistsHelper
  def invitation_form(playlist)
    #to be called in the view; checks logic of current user = owner (if true then render partial on view)
    if current_user == playlist.owner
      render "playlists/invitation_form"
    end
  end
end
