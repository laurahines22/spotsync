class User < ActiveRecord::Base
  has_many :contributors
  has_many :playlists, :through => :contributors
  has_many :playlist_tracks

  has_many :sets, :foreign_key => 'owner_id', :class_name => "Playlist"

  validates :nickname, :email, :token, :refresh_token, :uid, presence: true

end
