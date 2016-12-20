class Album < ActiveRecord::Base
  validates :title, :band, :album_type, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  searchable do
    text :title
  end

  def band_name
    self.band.name
  end

  def live?
    self.album_type == "live"
  end

  def is_owner?(user)
    self.band.is_owner?(user)
  end
end
