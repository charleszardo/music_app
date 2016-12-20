class AddIndexOnTaggableTypeToTaggings < ActiveRecord::Migration
  def change
    change_column :taggings, :taggable_type, :string, null: false
    add_index :taggings, [:tag_id, :taggable_id, :taggable_type], unique: true
    add_index :taggings, :taggable_id
  end
end
