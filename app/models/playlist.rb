class Playlist < ActiveRecord::Base
  has_many :playlist_tracks
  has_many :tracks, :through => :playlist_tracks
  has_many :contributors
  has_many :users, :through => :contributors
  belongs_to :owner, :class_name => "User"

  before_create :default_duration

  validates :name, presence: true

  #method that sets object's duration to 0 (aka default duration)
  def default_duration
    self.duration_s = 0
  end

end
