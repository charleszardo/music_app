class Band < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true

  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :albums, dependent: :destroy
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  searchable do
    text :name
    text :tags do
      tags.map(&:text)
    end
  end

  def is_owner?(user)
    self.owner == user
  end

  def display
    self.name
  end
end
