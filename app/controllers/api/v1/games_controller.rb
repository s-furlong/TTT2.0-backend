# frozen_string_literal: true
require_relative "../../../../lib/ttt_logic.rb"

module Api
  module V1
    class GamesController < ApplicationController
      def index

        board = params["board"]
        game = Tic.new(board)

        game_over = game.win?(board)
        current_player = game.which_won(board)
        tie = game.draw?(board)
        winner = game.winner(board)
        
        render :json => {:win => game_over, :token => current_player, :draw => tie, :winner => winner }
      end
    end
  end
end
