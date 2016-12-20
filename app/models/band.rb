class Band < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true

  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :albums, dependent: :destroy
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  def is_owner?(user)
    self.owner == user
  end
end
