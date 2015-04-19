class Playlist < ActiveRecord::Base
  has_many :playlist_tracks
  has_many :tracks, :through => :playlist_tracks
  has_many :contributors
  has_many :users, :through => :contributors
  belongs_to :owner, :class_name => "User"

  validates :name, presence: true
end
