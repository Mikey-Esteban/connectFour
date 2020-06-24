class ConnectFour
  attr_accessor :board
  attr_reader :player_a, :player_b

  def initialize
    @board = {}
  end

  def gameover
    false if is_board_full == true && win == false
    true
  end

  def is_board_full
    @board.each do |k,v|
      return false unless v.include?('0') || v.include?('1')
    end
    true
  end

  def win
    @board.each do |k,v|
      if v.include?('0')
        return true if check_row(k, '0')
        return true if check_col(k, '0')
        return true if check_diagonal(k, '0')
      elsif v.include?('1')
        return true if check_row(k, '0')
        return true if check_col(k, '0')
        return true if check_diagonal(k, '0')
      end
    end
    false
  end

  def create_2d_array
    6.times{|i|
      7.times{|j|
        board[[i,j]] = "[ ]"
      }
    }
    @board
  end

  private

  def check_row(node, value)
    row = node[0]
    col = node[1]
    check_right = true if col + 3 <= 6
    if check_right
      3.times do |i|
        next_node = col + i + 1
        temp = [row,next_node]
        return false unless board[temp].include?(value)
      end
      return true
    end
    nil
  end

  def check_col(node, value)
    row = node[0]
    col = node[1]
    check_down = true if row + 3 <= 5
    if check_down
      3.times do |i|
        next_node = row + i + 1
        temp = [next_node, col]
        return false unless board[temp].include?(value)
      end
      return true
    end
    nil
  end

  def check_diagonal(node, value)
    row = node[0]
    col = node[1]
    check_down_right = true if (row + 3 <= 5 && col + 3 <= 6)
    check_down_left = true if (row + 3 <= 5 && col - 3 >= 0)

    flag = true
    if check_down_right
      3.times do |i|
        next_row = row + i + 1
        next_col = col + i + 1
        temp = [next_row, next_col]
        return false if !board[temp].include?(value) && !check_down_left
      end
    end

    flag = true
    if check_down_left
      3.times do |i|
        next_row = row + i + 1
        next_col = col - i - 1
        temp = [next_row, next_col]
        return false if !board[temp].include?(value)
      end
    end
    flag
  end

end
