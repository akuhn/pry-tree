# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pry-tree/version'

Gem::Specification.new do |spec|
  spec.name          = "pry-tree"
  spec.version       = PryTree::VERSION
  spec.authors       = ["Adrian Kuhn"]
  spec.email         = ["akuhn@iam.unibe.ch"]

  spec.summary       = %q{Show tree of classes and methods in a module.}
  spec.homepage      = "https://github.com/akuhn/pry-tree"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
