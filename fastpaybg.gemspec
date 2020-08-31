# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'epaybg/version'

Gem::Specification.new do |gem|
  gem.name          = 'fastpaybg'
  gem.version       = Fastpaybg::VERSION
  gem.authors       = ['Svilen Vasilev']
  gem.email         = ['svsv@hey.com']
  gem.description   = 'Gem for dealing with fastpay.bg payments.'
  gem.summary       = 'Fastpay bg'
  gem.homepage      = 'https://github.com/tarakanbg/fastpaybg'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'activesupport'
end
