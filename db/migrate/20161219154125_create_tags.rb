class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :text, null: false

      t.timestamps null: false
    end

    add_index :tags, :text, unique: true
  end
end
