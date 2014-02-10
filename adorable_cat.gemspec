# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adorable_cat/version'

Gem::Specification.new do |spec|
  spec.name          = "adorable_cat"
  spec.version       = AdorableCat::VERSION
  spec.authors       = ["rishi"]
  spec.email         = ["rishi@joshsoftware.com"]
  spec.summary       = %q{It is a random cat fact and image generator.}
  spec.description   = %q{It is a random cat fact and image generator.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_runtime_dependency "json", '>=0'
  spec.add_runtime_dependency "rest-client"
  spec.add_runtime_dependency "nokogiri"
  spec.post_install_message = "Enjoy reading the cat facts and looking at those adorable cats."

end
