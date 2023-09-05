class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :url
      t.integer :user_id
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
