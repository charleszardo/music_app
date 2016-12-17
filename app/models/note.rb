class Note < ActiveRecord::Base
  validates :body, :author, :track, presence: true

  belongs_to :author, class_name: "User", foreign_key: :user_id
  belongs_to :track
end
