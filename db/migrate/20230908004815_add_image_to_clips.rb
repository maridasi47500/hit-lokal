class AddImageToClips < ActiveRecord::Migration[7.0]
  def change
    add_column :clips, :image, :string
  end
end
