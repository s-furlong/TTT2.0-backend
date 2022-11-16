WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5], 
    [6,7,8], 
    [0,3,6], 
    [1,4,7], 
    [2,5,8], 
    [0,4,8], 
    [2,4,6], 
  ]
  
  class Tic
  
    def initialize(arr)
      @arr = arr
    end
  
    def go
      #if over?(arr) #added - need this to avoid infinite loop problem on first play test -- BUT see below at play -- I put this in the wrong place
      #  return #added
      #else # added
        puts "Please enter 1-9:"
        z =  gets.chomp.to_i #changed input to z and took out anything after .  eg .to_i. -- chomp not help
        index = z.to_i - 1
        if index.between?(0,8) && !(@arr[index] != " " && @arr[index] != "")
          token = which_won(@arr)
          @arr[index] = token
          #return
        else
          go
        end
      puts " #{@arr[0]} | #{@arr[1]} | #{@arr[2]} "
      puts "-----------"
      puts " #{@arr[3]} | #{@arr[4]} | #{@arr[5]} "
      puts "-----------"
      puts " #{@arr[6]} | #{@arr[7]} | #{@arr[8]} "
      #end # added
    end
  
    def which_won(arr)
      counter = 0
      arr.each do |space|
        if space == "X" || space == "O"
          counter += 1
        end
      end
      if counter % 2 == 0
        "X"
      else
        "O"
      end
    end
  
    def won?
      arr_empty = @arr.all? do |space|
        space == " "
      end
      if arr_empty == true
        return false #return false
      else
        WIN_COMBINATIONS.each do |winning_array|
          new_array = [ ] #placement is very important.  Did not work where this was outside the WIN_COMBINATIONS each do
          winning_array.each do |index|
            new_array << @arr[index]
          end
          if new_array == ["X", "X", "X"] || new_array == ["O", "O", "O"]
            return winning_array # note the return is telling the whole method to stop! Distinguish this from break!
          end
        end
        return false # this is what got a return of false on a draw
      end
    end
  
    def full?(arr)
      arr_full = arr.all? do |space|
        space != " "
      end
      if arr_full == true
        true
      else
        false
      end
    end
  
    def draw?
      any_winner = won?
      arr_full = full?(@arr)
      if any_winner != false && arr_full == true #Don't feel great about this, but it's how I tested for false if game won -- because won? will either produce false or an array -- it won't produce true
          false
      elsif arr_full == false
        false
      else
        true
      end
    end
  
  
    def over?
      if draw? || won? # Note this is a good example of how you can run a function for "true".  This says, if running these produces true, then the return here is true
        true
      else
        false
      end
    end
  
    def winner(arr)
      if won? != false
        winny = won?
        arr[winny[0]]
      end
    end
  
    def check_and_ending(arr)
      if draw?
        puts "Cats Game!"
        return
      elsif won?
          puts "Congratulations #{winner(arr)}!"
          return
      end
    end
  
    def tac
      if over? == false # this is what solved it.  The problem I was having was one the very first test.
        loop do                # the testing there indicated it needed an "over" first.  
          go          # That would make almost all the other tests pass, but it had to go here.
          if over?
            break
          end
        end
      end
      if draw?
        puts "Cats Game!"
        return
      else
        puts "Congratulations #{winner(@arr)}!"
        return
      end
    end
  end
  
  puts "Welcome to Tic Tac Toe!"
  arr = [" "," "," "," "," "," "," "," "," "]
  Tic.new(arr).tac