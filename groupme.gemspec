# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'groupme/version'

Gem::Specification.new do |gem|
  gem.name          = "groupme"
  gem.version       = Groupme::VERSION
  gem.authors       = ["David Radcliffe"]
  gem.email         = ["radcliffe.david@gmail.com"]
  gem.description   = %q{Simple wrapper for the GroupMe v3 API}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/dwradcliffe/groupme"
  gem.licenses      = ['MIT']

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
