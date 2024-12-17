# db/migrate/001_create_chansons.rb
class CreateChansons < ActiveRecord::Migration[6.0]
  def change
    create_table :chansons do |t|
      t.string :title
      t.string :artist

      t.timestamps
    end
  end
end

