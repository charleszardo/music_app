class Track < ActiveRecord::Base
  validates :title, :album, :track_type, presence: true

  belongs_to :album
end
