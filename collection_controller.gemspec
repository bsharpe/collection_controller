
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "collection_controller/version"

Gem::Specification.new do |spec|
  spec.name          = "collection_controller"
  spec.version       = CollectionController::VERSION
  spec.authors       = ["Ben Sharpe"]
  spec.email         = ["bsharpe@gmail.com"]

  spec.summary       = %q{A great concern for basic Rail's collection/member style controllers.}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  # spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  #   f.match(%r{^(test|spec|features|gemspec)/})
  # end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "rails", "> 4", "< 7"
end
