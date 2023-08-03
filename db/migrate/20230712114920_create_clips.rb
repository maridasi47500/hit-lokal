class CreateClips < ActiveRecord::Migration[7.0]
  def change
    create_table :clips do |t|
      t.integer :cat_id
      t.string :title
      t.text :description
      t.string :link
      t.string :email
      t.string :region
      t.boolean :video

      t.timestamps
    end
  end
end
