class ChangeColumnsOnTaggings < ActiveRecord::Migration
  def change
    rename_column :taggings, :tagging_id, :taggable_id
    rename_column :taggings, :tagging_type, :taggable_type
  end
end
