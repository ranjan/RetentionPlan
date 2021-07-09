# frozen_string_literal: true

require_relative "lib/retention/version"

Gem::Specification.new do |spec|
  spec.name          = "retention"
  spec.version       = Retention::VERSION
  spec.authors       = ["Ranjan Kumar"]
  spec.email         = ["ranjankumar188@gmail.com"]

  spec.summary       = "Retention Plan"
  spec.description   = "Retention Plan description"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rspec',  '>= 3.0.0'
end
