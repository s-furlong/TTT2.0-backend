# frozen_string_literal: true

module Api
  module V1
    class GamesController < ApplicationController
      before_action :set_game, only: %i[show update destroy]
      
      def move
        render :json => {:name => "any name"}
        #REQUEST:
        #board = arr ARRAY
        
        #RESPONSE:
        #token = ttt_logic.which_won?(arr) STRING X or O
        #win = ttt_logic.win?(arr) BOOLEAN
        #draw = ttt_logic.draw?(arr) BOOLEAN
        #winner = ttt_logic.winner(arr) X or O
      end
      
      
      # GET /games
      def index
        # require 'pry'
        # binding.pry
        board = params["board"]
        render :json => {:name => board}
      end

      # GET /games/1
      def show
        render json: @game
      end

      # POST /games
      def create
        @game = Game.new(game_params)

        if @game.save
          render json: @game, status: :created, location: @game
        else
          render json: @game.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /games/1
      def update
        if @game.update(game_params)
          render json: @game
        else
          render json: @game.errors, status: :unprocessable_entity
        end
      end

      # DELETE /games/1
      def destroy
        @game.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_game
        @game = Game.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def game_params
        params.require(:game).permit(:title, :token)
      end
    end
  end
end
