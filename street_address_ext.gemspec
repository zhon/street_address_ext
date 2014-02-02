# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'street_address_ext/version'

Gem::Specification.new do |spec|
  spec.name          = "street_address_ext"
  spec.version       = StreetAddressFilter::VERSION
  spec.authors       = ["zhon"]
  spec.email         = ["zhon@xputah.org"]
  spec.description   = %q{#{spec.summary}}
  spec.summary       = %q{Extend StreetAddress}
  spec.homepage      = "https://github.com/zhon/street_address_ext"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'StreetAddress', '~> 1.0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rr", "~> 1.1"
  spec.add_development_dependency "guard", "~> 2.2"
  spec.add_development_dependency "guard-minitest", "~> 2.1"
  spec.add_development_dependency "minitest", "~> 5.2"
end
