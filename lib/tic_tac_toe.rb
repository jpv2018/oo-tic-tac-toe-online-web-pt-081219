class TicTacToe
  def initialize(board=nil)
    board = Array.new(9, " ")
  end
  WIN_COMBINATIONS = [ 
    [0, 1, 2], 
    [3, 4 ,5], 
    [6, 7, 8], 
    [0, 3, 6], 
    [1, 4, 7], 
    [2, 5, 8],
    [0, 4, 8], 
    [2, 4, 6]]
    
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
      user_input = input.to_i
      user_input - 1
    end
    
    def move(input_to_index, token = "X")
      @board[input_to_index] = token
    end
    
    def position_taken?(index)
      (@board[index] == "X") || (@board[index] == "O")
    end
    
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end
    
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end
    
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
    
    def turn 
      puts "Input position 1-9"
      input = gets
      index = input_to_index(input)
      token = current_player
      if valid_move?(index)
        move(index, token)
        display_board
      else
        turn
      end
    end
    
    def won?
      WIN_COMBINATIONS.detect do |win_combo|
        if @board[win_combo[0]] == "X" &&
          @board[win_combo[1]] == "X" &&
          @board[win_combo[2]] == "X"
          return win_combo
        elsif
          @board[win_combo[0]] == "O" &&
          @board[win_combo[1]] == "O" &&
          @board[win_combo[2]] == "O"
          return win_combo
        end
      end
    end
    
    def full?
      @board.all? {|i| i == "X" || i == "O"}
    end
    
    def draw?
      !won? && full?
    end
    
    def over?
      won? || full?
    end
    
    def winner
      WIN_COMBINATIONS.detect do |win_combo|
        if @board[win_combo[0]] == "X" &&
          @board[win_combo[1]] == "X" &&
          @board[win_combo[2]] == "X"
          return "X"
        elsif
        @board[win_combo[0]] == "O" &&
          @board[win_combo[1]] == "O" &&
          @board[win_combo[2]] == "O"
          return "O"
        end
      end
    end
    
    def play
      until over? || draw?
        turn
      end
      won?
        puts "Congratulations #{winner}!"
      draw?
        puts "Cat's Game!"
      end
      
    end
      
      