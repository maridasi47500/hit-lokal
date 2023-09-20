class CreateViewnews < ActiveRecord::Migration[7.0]
  def change
    create_table :viewnews do |t|
      t.integer :news_id

      t.timestamps
    end
  end
end
