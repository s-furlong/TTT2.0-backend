# frozen_string_literal: true

require_relative './ttt_logic'

puts 'Welcome to Tic Tac Toe!'
arr = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
Tic.new(arr).tac(arr)
