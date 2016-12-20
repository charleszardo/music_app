class Tag < ActiveRecord::Base
  validates :text, presence: true, uniqueness: true

  def self.find_or_create_by_tag(tag_name)
    tag = Tag.find_by(text: tag_name)
    tag = Tag.create(text: tag_name) if tag.nil?
    tag
  end
end
