# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dweet/version'

Gem::Specification.new do |spec|
  spec.name          = "dweet"
  spec.version       = Dweet::VERSION
  spec.authors       = ["vannell"]
  spec.email         = ["jbh@mindgoo.be"]
  spec.description   = %q{Ruby gem for dweet.io interaction}
  spec.summary       = %q{Push and retrieve dweets for all your things}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
