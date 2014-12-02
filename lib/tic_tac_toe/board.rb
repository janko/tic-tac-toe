require "matrix"
require "tty"

class TicTacToe
  class Board
    BLANK_SYMBOL = " "

    def initialize(matrix_or_size)
      @matrix =
        case matrix_or_size
        when Matrix  then matrix_or_size
        when Integer then Matrix.build(matrix_or_size) { BLANK_SYMBOL }
        end
    end

    def fields
      @matrix.each_with_index.map { |_, *field| field }
    end

    def size
      @matrix.row_count
    end

    def mark(field, symbol)
      new_matrix = @matrix.dup
      new_matrix.send(:[]=, *field, symbol)
      TicTacToe::Board.new(new_matrix)
    end

    def marked?(field)
      @matrix[*field] != BLANK_SYMBOL
    end

    def to_s
      table = TTY::Table.new(@matrix.to_a)
      table.render(:unicode) do |renderer|
        renderer.border.separator = :each_row
        renderer.padding = [0, 1, 0, 1]
      end
    end

    def rows
      @matrix.to_a
    end

    def columns
      @matrix.transpose.to_a
    end

    def diagonals
      (right_diagonals + left_diagonals)
        .map { |diagonal| diagonal.map { |field| @matrix[*field] } }
    end

    private

    # - - - -
    # x - - -
    # - x - -
    # - - x -
    def right_diagonals
      fields.group_by { |x, y| x - y }.values
    end

    # - - x -
    # - x - -
    # x - - -
    # - - - -
    def left_diagonals
      fields.group_by { |x, y| x + y }.values
    end
  end
end
