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
  
    def move(arr)
      # if over?(arr) #added - need this to avoid infinite loop problem on first play test -- BUT see below at play -- I put this in the wrong place
      #  return #added
      # else # added
      puts 'Please enter 1-9:'
      selection = gets.chomp.to_i
      index = selection.to_i - 1
      if index.between?(0, 8) && !(arr[index] != ' ' && arr[index] != '')
        token = which_won(@arr)
        arr[index] = token
      else
        move(arr)
      end
      puts " #{arr[0]} | #{arr[1]} | #{arr[2]} "
      puts '-----------'
      puts " #{arr[3]} | #{arr[4]} | #{arr[5]} "
      puts '-----------'
      puts " #{arr[6]} | #{arr[7]} | #{arr[8]} "
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
  
    def won?(arr)
      WIN_COMBINATIONS.each do |winning_array|
        new_array = [] # placement is very important.  Did not work where this was outside the WIN_COMBINATIONS each do
        winning_array.each do |index|
          new_array << arr[index]
        end
        if [%w[X X X], %w[O O O]].include?(new_array)
          return winning_array # NOTE: the return is telling the whole method to stop! Distinguish this from break!
        end
      end
      false # this is what movet a return of false on a draw
    end
  
    def full?(arr)
      arr.all? do |space|
        space != ' '
      end
    end
  
    def draw?(arr)
        full?(arr) && !won?(arr)
    end

    def win?(arr)
        if won?(arr)
            true
        end
    end
  
    def over?(arr)
      draw?(arr) || won?(arr)
    end
  
    def winner(arr)
      return unless won?(arr) != false
  
      winny = won?(arr)
      arr[winny[0]]
    end
  
    def check_and_ending(arr)
      if draw?(arr)
        puts 'Cats Game!'
        nil
      elsif won?(arr)
        puts "Congratulations #{winner(arr)}!"
        nil
      end
    end
  
    def tac(arr)
      if over?(arr) == false # this is what solved it.  The problem I was having was one the very first test.
        loop do # the testing there indicated it needed an "over" first.
          move(arr)          # That would make almost all the other tests pass, but it had to move here.
          break if over?(arr)
        end
      end
      if draw?(arr)
        puts 'Cats Game!'
      else
        puts "Congratulations #{winner(arr)}!"
      end
      nil
    end
  end