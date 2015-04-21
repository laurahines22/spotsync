class User < ActiveRecord::Base
  has_many :contributors
  has_many :playlists, :through => :contributors
  has_many :playlist_tracks

  has_many :sets, :foreign_key => 'owner_id', :class_name => "Playlist"

  validates :nickname, :email, :token, :refresh_token, :uid, presence: true


  def self.find_or_create_from_auth_hash(auth_hash)
    User.find_by(:uid => auth_hash["info"]["id"], :provider => "spotify") || User.create_with_omnihash(auth_hash)
  end

  def self.create_with_omnihash(auth_hash)
    User.create! do |user|
      user.name = auth_hash["info"]["display_name"]
      user.nickname = auth_hash["info"]["id"]
      user.email = auth_hash["info"]["email"]
      user.profile_url=auth_hash["info"]["external_urls"]["spotify"]
      if !auth_hash["info"]["images"].empty? 
        user.profile_image = auth_hash["info"]["images"][0]["url"]
      end
      user.token = auth_hash["credentials"]["token"]
      user.refresh_token = auth_hash["credentials"]["refresh_token"]
      user.expires_at = auth_hash["credentials"]["expires_at"]
      user.expires = auth_hash["credentials"]["expires"]
      user.provider = auth_hash["provider"]
      user.uid = auth_hash["info"]["id"]
    end
  end

end
