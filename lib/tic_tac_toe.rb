class TicTacToe
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def play
        while (turn_count < 9 && !over?)
            turn
        end
        if draw?
            puts "Cat's Game!"
            return
        end
        if won?
            puts "Congratulations #{winner}!"
            return
        end
    end
    
    def turn
        display_board
        puts "Where would you like to go?"
        input = gets.strip
        index = input_to_index(input)
        if !valid_move?(index)
            turn
        end
        move(index, current_player)
    end
    
    def move(index, player)
        @board[index] = player
    end
    
    def input_to_index(input)
        input.to_i - 1
    end
    
    def position_taken?(index)
        if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
            return false
        end
        return true
    end
    def valid_move?(index)
        if !position_taken?(index)
            if index.between?(0, 8)
                return true
            end
        end
        return false
    end
    
    def current_player
        if (turn_count % 2 == 0) 
            return 'X'
        end
        return 'O'
    end
    
    def turn_count
        count = 0
        @board.each { |n|
            if (n == 'X' || n == 'O')
                count += 1
            end
        }
        return count
    end
    
    def full?
        count = 0
        @board.each { |n|
            if (n == 'X' || n == 'O')
                count += 1
            end
        }
        if (count == 9)
            return true
        else
            return false
        end
    end
    
    def over?
        if (won? || draw?)
            return true
        end
        return false
    end
    
    def won?
        WIN_COMBINATIONS.each { |combination|
    
        pos1 = @board[combination[0]]
        pos2 = @board[combination[1]]
        pos3 = @board[combination[2]]
        
        if (pos1 == 'X' && pos2 == 'X' && pos3 == 'X') || (pos1 == 'O' && pos2 == 'O' && pos3 == 'O') then
            return combination
        end
        }
        return false
    end
    
    def draw?
        if full? && won? == false
            return true
        else
            return false
        end
    end
    
    def winner
        WIN_COMBINATIONS.each { |combination|
    
        pos1 = @board[combination[0]]
        pos2 = @board[combination[1]]
        pos3 = @board[combination[2]]
    
        if (pos1 == 'X' && pos2 == 'X' && pos3 == 'X') || (pos1 == 'O' && pos2 == 'O' && pos3 == 'O') then
            return pos1
        end
        }
        return nil
    end
end