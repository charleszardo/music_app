class Tagging < ActiveRecord::Base
  validates :tag_id, :taggable_id, :taggable_type, presence: true

  belongs_to :taggable, polymorphic: true
  belongs_to :tag
  validates_uniqueness_of :tag_id, scope: [:taggable_id, :taggable_type]

  def tag=(tag_name)
    tag = Tag.find_or_create_by_tag(tag_name)
    self.tag_id = tag.id
  end
end
