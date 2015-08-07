$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "scrabble/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name          = "scrabble"
  gem.version       = Scrabble::VERSION
  gem.authors       = ["Gonzalo Bulnes Guilpain"]
  gem.email         = ["gon.bulnes@gmail.com"]
  gem.summary       = %q{A board game in which players create words from sets of letters.}
  gem.homepage      = "https://github.com/gonzalo-bulnes/kata-scrabble"
  gem.license       = "GPL-3.0"

  gem.files = Dir["{lib}/**/*", "Gemfile", "LICENSE", "Rakefile", "README.md"]
  gem.test_files = Dir["spec/**/*"]

  gem.add_dependency 'thor', '~> 0.19.1'

  gem.add_development_dependency 'inch', '~> 0.6.0'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 3.0'
end

