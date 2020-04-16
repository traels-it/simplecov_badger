require_relative 'lib/simplecov_badger/version'

Gem::Specification.new do |spec|
  spec.name          = "simplecov_badger"
  spec.version       = SimplecovBadger::VERSION
  spec.authors       = ["Nicolai Bach Woller"]
  spec.email         = ["woller@traels.it"]

  spec.summary       = %q{A small gem that posts simplecovs test coverage to a web service.}
  spec.description   = %q{A small gem that posts simplecovs test coverage to a web service.}
  spec.homepage      = "https://github.com/traels-it/simplecov_badger"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # dependencies
  spec.add_dependency "simplecov", "~> 0.18.5"
  spec.add_dependency "rest-client", "~> 2.1.0"

  spec.add_development_dependency "m", "~> 1.5.1"
  spec.add_development_dependency "mocha", "~> 1.11.2"
end
