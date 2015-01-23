# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec-mail-matchers/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-mail-matchers"
  spec.version       = Rspec::Mail::Matchers::VERSION
  spec.authors       = ["Ed Robinson"]
  spec.email         = ["ed.robinson@reevoo.com"]
  spec.summary       = %q{ RSpec Matchers for the Mail gem}
  spec.homepage      = "http://reevoo.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec-expectations", "> 2.11"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
