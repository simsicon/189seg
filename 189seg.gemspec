# -*- encoding: utf-8 -*-
require File.expand_path('../lib/189seg/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["simsicon"]
  gem.email         = ["simsicon@gmail.com"]
  gem.description   = %q{A gem using 189 works Chinese segment api}
  gem.summary       = %q{A gem using 189 works Chinese segment api}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "189seg"
  gem.require_paths = ["lib"]
  gem.version       = CnTelecomeSeg::VERSION
  gem.add_dependency('rest-client', '>= 1.6.6')
  gem.add_dependency('yajl-ruby', '>= 0.8.3')
end
