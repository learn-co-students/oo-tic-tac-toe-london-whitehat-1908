    class TicTacToe

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end 

    def board
        @board
    end

    def position_taken?(index)
        !(board[index].nil? || board[index] == " ")
    end
    
    
    def draw?
    !won? && !@board.include?(" ")
    end
    
    def full?
        @board.each { |space|
        if space == " "
        return false
        end
    }
    return true
        end
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
    end 
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5], 
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]
    def won?
        WIN_COMBINATIONS.each do |win_combination|
        
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        
        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]
        
        if (position_1 == "X" && position_2 == "X" && position_3 == "X") or (position_1 == "O" && position_2 == "O" && position_3 == "O")
            return win_combination 
        else
            false
        end
        end
        false

    end
    
    def over?
    if (won?) or (draw?) then
        return true
    end
    return false
    end 
    
    def winner
    if won? then
        return @board[won?[0]]
    end
    end 
    def input_to_index(num)
        num.to_i - 1
    end
    def move (index, input="X")
        @board[index.to_i] = input
    end

    def valid_move?(index)
        if index.between?(0 , 8) && @board[index] == " " then
            return true
        else 
            return false
        end
    end

    def turn_count
        turns = 0
        @board.each do |i|
            if i == "X" || i == "O" then
                turns += 1
            end 
          end 
          return turns
        end
        
        def current_player
            turns = turn_count
            if turns%2==0 then
              return "X"
            else
              return "O"
            end
        end 
        

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index) then
            move(index, current_player)
            display_board()
        else
            turn()
        end     
    end 

def play
    while (turn_count < 9 && !over?)
        turn
    end
    if draw?
        puts "Cat's Game!"
    end
    if won?
        puts "Congratulations #{winner}!"
        
    end
end

    end

