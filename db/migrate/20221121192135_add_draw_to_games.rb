class AddDrawToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :draw, :boolean
  end
end
