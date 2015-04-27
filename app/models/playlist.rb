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

  def add_track(track, user)
    PlaylistTrack.new({:playlist_id => self.id, :track_id => track.id, :user_id => user.id, :played => false, :order_num => self.find_order_num} )
  end

  def find_order_num
    if PlaylistTrack.find_by(:playlist_id => self.id) == nil
      1
    else
      PlaylistTrack.where(:playlist_id => self.id).order(:order_num => :desc).limit(1).first.order_num+1
    end
  end
end
