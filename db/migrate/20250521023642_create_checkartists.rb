class CreateCheckartists < ActiveRecord::Migration[7.0]
  def change
    create_table :checkartists do |t|
      t.string :name
      t.string :country
      t.string :isArtist

      t.timestamps
    end
  end
end
