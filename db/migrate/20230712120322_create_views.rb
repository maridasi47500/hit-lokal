class CreateViews < ActiveRecord::Migration[7.0]
  def change
    create_table :views do |t|
      t.integer :clip_id

      t.timestamps
    end
  end
end
