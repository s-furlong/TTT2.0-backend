class RemoveTitleFromGmaes < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :title, :string
  end
end
