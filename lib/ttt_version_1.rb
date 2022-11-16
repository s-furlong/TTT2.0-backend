# frozen_string_literal: true

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
].freeze

class Tic
  def initialize(arr)
    @arr = arr
  end

  def go
    # if over?(arr) #added - need this to avoid infinite loop problem on first play test -- BUT see below at play -- I put this in the wrong place
    #  return #added
    # else # added
    Rails.logger.debug 'Please enter 1-9:'
    z = gets.chomp.to_i # changed input to z and took out anything after .  eg .to_i. -- chomp not help
    index = z.to_i - 1
    if index.between?(0, 8) && !(@arr[index] != ' ' && @arr[index] != '')
      token = which_won(@arr)
      @arr[index] = token
      # return
    else
      go
    end
    Rails.logger.debug { " #{@arr[0]} | #{@arr[1]} | #{@arr[2]} " }
    Rails.logger.debug '-----------'
    Rails.logger.debug { " #{@arr[3]} | #{@arr[4]} | #{@arr[5]} " }
    Rails.logger.debug '-----------'
    Rails.logger.debug { " #{@arr[6]} | #{@arr[7]} | #{@arr[8]} " }
    # end # added
  end

  def which_won(arr)
    counter = 0
    arr.each do |space|
      counter += 1 if %w[X O].include?(space)
    end
    if counter.even?
      'X'
    else
      'O'
    end
  end

  def won?
    arr_empty = @arr.all? do |space|
      space == ' '
    end
    return false if arr_empty == true

    # return false

    WIN_COMBINATIONS.each do |winning_array|
      new_array = [] # placement is very important.  Did not work where this was outside the WIN_COMBINATIONS each do
      winning_array.each do |index|
        new_array << @arr[index]
      end
      if [%w[X X X], %w[O O O]].include?(new_array)
        return winning_array # NOTE: the return is telling the whole method to stop! Distinguish this from break!
      end
    end
    false # this is what got a return of false on a draw
  end

  def full?(arr)
    arr_full = arr.all? do |space|
      space != ' '
    end
    arr_full == true
  end

  def draw?
    any_winner = won?
    arr_full = full?(@arr)
    if any_winner != false && arr_full == true # Don't feel great about this, but it's how I tested for false if game won -- because won? will either produce false or an array -- it won't produce true
      false
    else
      arr_full != false
    end
  end

  def over?
    draw? || won?
  end

  def winner(arr)
    return unless won? != false

    winny = won?
    arr[winny[0]]
  end

  def check_and_ending(arr)
    if draw?
      Rails.logger.debug 'Cats Game!'
      nil
    elsif won?
      Rails.logger.debug { "Congratulations #{winner(arr)}!" }
      nil
    end
  end

  def tac
    if over? == false # this is what solved it.  The problem I was having was one the very first test.
      loop do # the testing there indicated it needed an "over" first.
        go          # That would make almost all the other tests pass, but it had to go here.
        break if over?
      end
    end
    if draw?
      Rails.logger.debug 'Cats Game!'
    else
      Rails.logger.debug { "Congratulations #{winner(@arr)}!" }
    end
    nil
  end
end

Rails.logger.debug 'Welcome to Tic Tac Toe!'
arr = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
Tic.new(arr).tac
