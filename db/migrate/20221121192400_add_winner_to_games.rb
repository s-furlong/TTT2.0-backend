# frozen_string_literal: true

class AddWinnerToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :winner, :string
  end
end
