class AddSortieToClips < ActiveRecord::Migration[7.0]
  def change
    add_column :clips, :sortie, :date
  end
end
