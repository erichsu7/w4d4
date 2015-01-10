class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.integer :band_id, null: false
      t.string :genre
      t.integer :year
      t.string :album_type

      t.timestamps null: false
    end

    add_index :albums, :name
  end
end
