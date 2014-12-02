class TicTacToe
  class Rules
    def initialize(goal)
      @goal = goal
    end

    def game_over?(board, players)
      players.any? { |player| player_won?(player, board) } or board_full?(board)
    end

    private

    def board_full?(board)
      board.fields.all? { |field| board.marked?(field) }
    end

    def player_won?(player, board)
      (board.rows + board.columns + board.diagonals).any? do |sequence|
        winning_adjacency?(player.symbol, sequence)
      end
    end

    def winning_adjacency?(symbol, sequence)
      /#{symbol}{#{@goal},}/ === sequence.join
    end
  end
end
