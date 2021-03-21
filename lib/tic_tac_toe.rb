require "pry"
class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(board, index)
        @board[board] = index
    end

    def position_taken?(index)
        if @board[index] == " "
            return false
           else
            return true
        end
    end

    def valid_move?(index)
        if !position_taken?(index) && index.between?(0,8)
            return true
        end
    end

    def turn_count
        @board.count {|index| index == "X" || index == "O" }
    end

    def current_player
        if turn_count.even?
            "X"
        else
            "O"
        end
    end

    def turn
        puts "Specify a position between 1-9:"
        user_input = gets.strip
        index_number = input_to_index(user_input)
        if valid_move?(index_number)
            move(index_number, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each {|win_combo|
        index_0 = win_combo[0]
        index_1 = win_combo[1]
        index_2 = win_combo[2]

        position_0 = @board[index_0]
        position_1 = @board[index_1]
        position_2 = @board[index_2]

        if position_0 == "X" && position_1 == "X" && position_2 == "X"
            return win_combo
        elsif position_0 == "O" && position_1 == "O" && position_2 == "O"
            return win_combo
        end
    }
    return false
    end

    def full?
        @board.all? {|index| index == "X" || index == "O"}
    end

    def draw?
        if !won? && full?
            return true
        else 
            return false
        end
    end

    def over?
        if won? || draw?
            return true
        else
            return false
        end
    end

    def winner
        index = won?
        if index == false
        
        else
            if @board[index[0]] == "X"
                return "X"
            else
                return "O"
            end
        end
    end

    def play 
        until over? == true
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else draw?
            puts "Cat's Game!"
        end
    end
end