class AddUrlToChansons < ActiveRecord::Migration[6.0]
  def change
    add_column :chansons, :url, :string
  end
end
