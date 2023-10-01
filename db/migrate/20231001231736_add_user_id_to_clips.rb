class AddUserIdToClips < ActiveRecord::Migration[7.0]
  def change
    add_column :clips, :user_id, :integer
  end
end
