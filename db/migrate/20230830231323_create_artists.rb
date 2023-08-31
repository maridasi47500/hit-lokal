class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :clipsartists do |t|
      t.integer :clip_id
      t.integer :artist_id
    end
    create_table :artists do |t|
      t.string :name

      t.timestamps
    end
  end
end
