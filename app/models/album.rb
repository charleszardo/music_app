class Album < ActiveRecord::Base
  validates :title, :band, :live, presence: true

  belongs_to :band
end
