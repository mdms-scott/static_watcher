# -*- encoding: utf-8 -*-
require File.expand_path('../lib/static_watcher/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matt Scott"]
  gem.email         = ["mdms.scott@gmail.com"]
  gem.description   = "Watches for changes and compiles Haml, Sass, Scss, and Coffeescript"
  gem.summary       = "Watches for changes and compiles Haml, Sass, Scss, and Coffeescript.  Requires you to have coffeescript installed, and thus node.js."
  gem.homepage      = "https://github.com/mdms-scott/static_watcher"

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
