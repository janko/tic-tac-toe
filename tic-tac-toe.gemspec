Gem::Specification.new do |gem|
  gem.name          = "tic-tac-toe"
  gem.version       = "0.0.1"

  gem.required_ruby_version = ">= 2.0"

  gem.description   = %q{Play the tic-tac-toe game in the Terminal. Supports fields of any size, and can be played with up to 5 players.}
  gem.summary       = %q{Play the tic-tac-toe game in the Terminal.}
  gem.homepage      = "https://github.com/janko-m/tic-tac-toe"
  gem.author        = ["Janko Marohnić"]
  gem.email         = ["janko.marohnic@gmail.com"]

  gem.license       = "MIT"

  gem.files         = Dir["README.md", "LICENSE", "lib/**/*.rb"]
  gem.executables   = ["tic-tac-toe"]

  gem.add_dependency "curses", "~> 1.0"
  gem.add_dependency "tty", "= 0.1.0"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", "~> 3.1"
  gem.add_development_dependency "cucumber", ">= 1.3.17", "< 2.0"
end
