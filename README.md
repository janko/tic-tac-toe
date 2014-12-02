# Tic-tac-toe

Play a game of tic-tac-toe in your Terminal.

![Tic-tac-toe video](/preview.png)

## Installation

```sh
$ gem install tic-tac-toe
```

## Usage

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

The game was implemented in Ruby using [`ruby/curses`](https://github.com/ruby/curses),
Ruby bindings for the Curses C library.

## License

MIT.
