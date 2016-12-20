class Track < ActiveRecord::Base
  validates :title, :album, :track_type, presence: true

  belongs_to :album
  has_one :band, through: :album
  has_many :notes, dependent: :destroy
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  searchable do
    text :title
    text :tags do
      tags.map(&:text)
    end
  end

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

  def is_owner?(user)
    self.album.is_owner?(user)
  end

  def display
    self.title
  end
end
