class Album < ActiveRecord::Base
  validates :title, :band, :album_type, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy

  def band_name
    self.band.name
  end

  def live?
    self.album_type == "live"
  end
end
