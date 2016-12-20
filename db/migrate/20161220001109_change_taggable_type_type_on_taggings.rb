class ChangeTaggableTypeTypeOnTaggings < ActiveRecord::Migration
  def change
    remove_column :taggings, :taggable_type
    add_column :taggings, :taggable_type, :string
  end
end
