class RenameAndChangeTypeOfLiveColumnOnAlbums < ActiveRecord::Migration
  def change
    rename_column :albums, :live, :album_type
    change_column :albums, :album_type, :string
  end
end
