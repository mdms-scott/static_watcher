# -*- encoding: utf-8 -*-
require File.expand_path('../lib/static_watcher/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matt Scott"]
  gem.email         = ["scoma@musc.edu"]
  gem.description   = "testing"
  gem.summary       = "testing"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "static_watcher"
  gem.require_paths = ["lib"]
  gem.version       = StaticWatcher::VERSION

  gem.add_runtime_dependency "haml"
  gem.add_runtime_dependency "sass"
  gem.add_runtime_dependency "fssm"
end
