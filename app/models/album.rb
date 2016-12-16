class Album < ActiveRecord::Base
  validates :title, :band, :live, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy

  def band_name
    self.band.name
  end
end
