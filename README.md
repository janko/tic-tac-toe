# Tic-tac-toe

Play a game of tic-tac-toe in your Terminal.

![Tic-tac-toe preview](/preview.png)

## Installation

```sh
$ gem install tic-tac-toe-ruby
```

## Usage

```sh
$ tic-tac-toe --size 10 --players 3 --goal 4
```
```
$ tic-tac-toe --help
USAGE: tic-tac-toe [options]

Moving: Arrow keys or h/j/k/l
Placing symbol: <Space>
Exit: Ctrl-C

    -n, --size N               Size of the board (default: 3)
    -p, --players N            The number of players (default: 2, max: 5)
    -g, --goal N               The number symbols in a row is required (default: 3)
```

## Implementation

The game was implemented in Ruby using the [`curses`](https://github.com/ruby/curses)
gem, which binds to Curses C library.

## License

MIT.
