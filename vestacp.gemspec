# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vestacp/version'

Gem::Specification.new do |spec|
  spec.name          = "vestacp"
  spec.version       = Vestacp::VERSION
  spec.authors       = ["Dmitry Knyazev"]
  spec.email         = ["a@kdas.me"]
  spec.summary       = %q{VestaCP API bindings}
  spec.description   = %q{Developed and tested on version 0.9.8-14. Only to do simple things with user accounts. That's not a problem to make them more complicated :)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", ">= 0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
