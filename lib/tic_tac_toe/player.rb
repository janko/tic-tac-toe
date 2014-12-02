class TicTacToe
  Player = Struct.new(:symbol, :color)

  class PlayerList
    AVAILABLE_PLAYERS = [
      Player.new("x", :red),
      Player.new("○", :blue),
      Player.new("△", :yellow),
      Player.new("□", :green),
      Player.new("◇", :magenta),
    ]

    include Enumerable

    def initialize(number)
      @players     = AVAILABLE_PLAYERS.first(number)
      @current_idx = 0
    end

    def each(&block)
      @players.each(&block)
    end

    def current
      @players[@current_idx]
    end

    def next!
      @current_idx = (@current_idx + 1) % @players.count
    end

    def colors
      @players.inject({}) do |colors, player|
        colors.update(player.symbol => player.color)
      end
    end
  end
end
