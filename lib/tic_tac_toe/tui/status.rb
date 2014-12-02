require "strscan"

class TicTacToe
  class TUI
    class Status
      def initialize(window)
        @window = window
      end

      def update(players, current_player = nil)
        cursor_position = [@window.cury, @window.curx]
        do_update(players, current_player)
        Curses.refresh
        @window.setpos(*cursor_position)
      end

      private

      def do_update(players, current_player = nil)
        max_cols = (Curses.lines / 2 - @window.maxy / 2)
        start = (max_cols - (players.count * 2 - 1)) / 2

        players.each.with_index do |player, idx|
          line = "Player #{player.symbol}".center(Curses.cols)[1..-1]
          scanner = StringScanner.new(line)

          Curses.setpos(start + idx * 2, 0)

          Curses.attron(Curses::A_BOLD) if player == current_player

          text = scanner.scan_until(/(?=#{player.symbol})/)
          Curses.addstr(text)

          write_symbol(scanner.getch, player.color)

          text = scanner.scan_until(/\Z/)
          Curses.addstr(text)

          Curses.attroff(Curses::A_BOLD) if player == current_player
        end
      end

      def write_symbol(symbol, color_name)
        color = Curses.const_get("COLOR_#{color_name.upcase}")
        Curses.attron(Curses.color_pair(color)) do
          Curses.addstr(symbol)
        end
      end
    end
  end
end
