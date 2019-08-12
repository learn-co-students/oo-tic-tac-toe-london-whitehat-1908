class TicTacToe
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end
  

WIN_COMBINATIONS = [
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [6,4,2],
    [3,4,5],
    [6,7,8]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
   index = user_input.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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
  
  def turn_count
    turn_count = 0
  
    @board.each do |counter|
      if counter == "X" || counter == "O"
        turn_count += 1
      end
    end
  
    turn_count
  end
  
  def current_player
    turn_count.even? ? "X" : turn_count.odd? ? "O" : "X"
  end
  
  def won?
  
    WIN_COMBINATIONS.each do |win_combo|
      p1 = @board[win_combo[0]]
      p2 = @board[win_combo[1]]
      p3 = @board[win_combo[2]]
  
      if (p1 == "X" && p2 == "X" && p3 == "X") || (p1 == "O" && p2 == "O" && p3 == "O")
        return win_combo
      end
  
    end
      return false
  end

  def full?
    @board.all? { |i| i == "X" || i == "O" }
  end
  
  def draw?
    if (full? == false)
      return false
    else
      if (won? != false)
        return false
      else
        return true
      end
    end
  end

def over?
    won? || draw?
  end
  
  def winner
    if (over?)
      if (@board[won?[0]] == "X")
        return "X"
      else
        return "O"
      end
    else
    end
  end
  
  def play
    while !over?
      turn
    end
    if won?
      return puts "Congratulations #{winner}!"
    elsif draw?
      return puts "Cat's Game!"
    end
  
  end
end