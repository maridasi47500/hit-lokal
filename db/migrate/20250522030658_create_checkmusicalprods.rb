class CreateCheckmusicalprods < ActiveRecord::Migration[7.0]
  def change
    create_table :checkmusicalprods do |t|
      t.string :name
      t.string :country
      t.integer :isMusicalprod

      t.timestamps
    end
  end
end
