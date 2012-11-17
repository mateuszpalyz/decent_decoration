# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'decent_decoration/version'

Gem::Specification.new do |gem|
  gem.name          = "decent_decorate"
  gem.version       = DecentDecoration::VERSION
  gem.authors       = ["Tomasz Pewiński"]
  gem.email         = ["pewniak747@gmail.com"]
  gem.description   = %q{Use decent_exposure with decorators (e.g. Draper)}
  gem.summary       = %q{Use decent_exposure with decorators (e.g. Draper)}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
