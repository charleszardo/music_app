class Tagging < ActiveRecord::Base
  validates :tag_id, :tagging_id, :tagging_type, presence: true
end
