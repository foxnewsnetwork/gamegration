# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gamegration/version'

Gem::Specification.new do |gem|
  gem.name          = "gamegration"
  gem.version       = Gamegration::VERSION
  gem.authors       = ["Thomas"]
  gem.email         = ["tom@ioffer.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency "rspec", "~>2.14.0"
  gem.add_development_dependency "simplecov", "~>0.7"
  gem.add_development_dependency "faker", "~>1.2"
  gem.add_dependency "capybara", "~>2.1.0"
end
