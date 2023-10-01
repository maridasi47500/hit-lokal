class AddComposerIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :compose, :boolean, default: false
    add_column :users, :prod, :boolean, default: true
  end
end
