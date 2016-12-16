class Track < ActiveRecord::Base
  validates :title, :album, :track_type, presence: true

  belongs_to :album

  def bonus?
    self.track_type == "bonus"
  end

  def album_title
    self.album.title
  end

  def band
    self.album.band
  end

  def band_name
    self.band.name
  end
end
