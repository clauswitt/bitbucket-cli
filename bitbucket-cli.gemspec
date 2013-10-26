# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitbucket/cli/version'

Gem::Specification.new do |spec|
  spec.name          = "bitbucket-cli"
  spec.version       = Bitbucket::Cli::VERSION
  spec.authors       = ["Claus Witt"]
  spec.email         = ["claus@wittnezz.dk"]
  spec.description   = %q{git plugin for using bitbucket}
  spec.summary       = %q{interact with bitbucket through cli}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "bitbucket_rest_api"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
