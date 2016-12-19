class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id, null: false
      t.integer :tagging_id, null: false
      t.integer :tagging_type, null: false

      t.timestamps null: false
    end

    add_index :taggings, :tag_id
    add_index :taggings, [:tagging_id, :tagging_type]
  end
end
