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
  gem.add_runtime_dependency     'decent_exposure', '> 0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rspec-rails', '~> 2.7'
  gem.add_development_dependency 'actionpack', '~> 3.1'
  gem.add_development_dependency 'activesupport', '~> 3.1'
end
