require 'ttt_logic'

describe "Tic Class" do
    context "which_won?" do
        it "will produce an X token if the board is blank" do
            arr = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
            tic = Tic.new(arr)

            token = tic.which_won(arr)

            expect(token).to eq("X")
        end

        it "will produce an X token there is an even number of X and O on board" do
            arr = ['X', 'O', 'X', 'O', ' ', ' ', ' ', ' ', ' ']
            tic = Tic.new(arr)

            token = tic.which_won(arr)

            expect(token).to eq("X")
        end

        it "will produce an O token there is an odd number of X and O on board" do
            arr = ['X', 'O', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
            tic = Tic.new(arr)

            token = tic.which_won(arr)

            expect(token).to eq("O")
        end
    end

    context "won?" do
        it "will return winning index positions if there are three connecting tokens" do
            arr = ['X', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'O']
            tic = Tic.new(arr)

            win = tic.won?(arr)

            expect(win).to eq([0, 1, 2])
        end

        it "will return false if there are no combinatiions" do
            arr = ['X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O']
            tic = Tic.new(arr)

            draw = tic.won?(arr)

            expect(draw).to eq(false)
        end
    end

    context "full?" do
        it "will return true if the board is full" do
            arr = ['X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O']
            tic = Tic.new(arr)

            full = tic.full?(arr)

            expect(full).to eq(true)
        end

        it "will return false if there is still blank space" do
            arr = ['X', 'O', 'X', 'X', ' ', 'X', ' ', 'X', 'O']
            tic = Tic.new(arr)

            in_progress = tic.full?(arr)

            expect(in_progress).to eq(false)
        end
    end

    context "draw?" do
        it "will return false if the board has winning combination" do
            arr = ['X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'O']
            tic = Tic.new(arr)

            win = tic.draw?(arr)

            expect(win).to eq(false)
        end

        it "will return true if the board has no winning combination" do
            arr = ['X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O']
            tic = Tic.new(arr)

            draw = tic.draw?(arr)

            expect(draw).to eq(true)
        end
    end

    context "over?" do
        it "will return win combination if the game is won" do
            arr = ['X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'O']
            tic = Tic.new(arr)

            win = tic.over?(arr)

            expect(win).to eq([0, 3, 6])
        end

        it "will return true if the game is draw" do
            arr = ['X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O']
            tic = Tic.new(arr)

            win = tic.over?(arr)

            expect(win).to eq(true)
        end

        it "will return false if the game is draw" do
            arr = ['X', 'O', ' ', 'X', 'O', 'X', 'O', 'X', 'O']
            tic = Tic.new(arr)

            not_over = tic.over?(arr)

            expect(not_over).to eq(false)
        end
    end

    context "winner" do
        it "will return nil if there is no winner" do
            arr = ['X', 'O', ' ', 'X', 'O', 'X', 'O', 'X', 'O']
            tic = Tic.new(arr)

            no_winner = tic.winner(arr)

            expect(no_winner).to eq(nil)
        end

        it "will return token of the winner" do
            arr = ['X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'O']
            tic = Tic.new(arr)

            winner = tic.winner(arr)

            expect(winner).to eq("X")
        end 
    end

    context "check_and_ending" do
        it "will return nil is a draw" do
            arr = ['X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O']
            tic = Tic.new(arr)

            no_winner = tic.check_and_ending(arr)

            expect(no_winner).to eq(nil)
        end

        it "will return nil if there is a winner" do
            arr = ['X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O']
            tic = Tic.new(arr)

            no_winner = tic.check_and_ending(arr)

            expect(no_winner).to eq(nil)
        end
    end
end