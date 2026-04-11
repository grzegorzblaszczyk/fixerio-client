
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fixer/client/version"

Gem::Specification.new do |spec|
  spec.name          = "fixerio_client"
  spec.version       = Fixer::Client::VERSION
  spec.authors       = ["Grzegorz Błaszczyk"]
  spec.email         = ["grzegorz.blaszczyk@gmail.com"]

  spec.summary       = "Get latest or historic currency rates for base EUR from api.fixer.io"
  spec.description   = "Get latest or historic currency rates for base EUR from api.fixer.io"
  spec.homepage      = "https://github.com/grzegorzblaszczyk/fixerio-client"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["config", "lib"]

  spec.add_development_dependency "bigdecimal", ">=4.1.1"
  spec.add_development_dependency "bundler", ">=4.0.10"
  spec.add_development_dependency "ostruct", "~> 0.6.3"
  spec.add_development_dependency "pry", "~> 0.16.0"
  spec.add_development_dependency "rake", "~> 13.3"
  spec.add_development_dependency "rspec", "~> 3.13"
  spec.add_development_dependency "rubocop", "~> 1.86.1"
  spec.add_development_dependency "simplecov-console", "~> 0.9.5"
  spec.add_development_dependency "simplecov-cobertura", "~> 3.1.0"
  spec.add_development_dependency "vcr", "~> 6.4"
  spec.add_development_dependency "webmock", "~> 3.26"
end
