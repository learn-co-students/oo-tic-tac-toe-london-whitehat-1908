class TicTacToe
    def initialize
        @board = Array.new(9, ' ')
    end

    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    # Helper Method
    def position_taken?(index)
        !(@board[index].nil? || @board[index] == " ")
    end

    # Define your WIN_COMBINATIONS constant
    WIN_COMBINATIONS =
    [ [0, 1, 2], # across
        [3, 4, 5],
        [6, 7, 8],

        [0, 3, 6], # down
        [1, 4, 7],
        [2, 5, 8],

        [0, 4, 8], # diag
        [2, 4, 6]
    ]

    def won?
    WIN_COMBINATIONS.each do |combination|
        return combination if combination.all? { |i| @board[i] == 'X' }\
                        || combination.all? { |i| @board[i] == 'O'}
    end
    return false
    end

    def full?
    @board.select { |cell| cell == 'X' || cell == 'O'}.length >= 8
    end

    def draw?
    full? && !won?
    end

    def over?
    won? || full?
    end

    def winner
    win_row = won?
    @board[win_row.first] if win_row
    end

    def turn_count
        @board.count { |cell| cell == 'X' || cell == 'O' }
    end

    def current_player
        turn_count % 2 == 0 ? 'X' : 'O'
    end

    def input_to_index(user_input)
    user_input.to_i - 1
    end

    def move(index, current_player)
    @board[index] = current_player
    end

    def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def play
        while !over? do
            turn
            break if draw?
        end

        if won?
            puts "Congratulations %s!" % winner
        elsif draw?
            puts "Cat's Game!"
        end
    end
end