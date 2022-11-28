# frozen_string_literal: true

class AddBoardToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :board, :string, array: true, default: [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end
end
