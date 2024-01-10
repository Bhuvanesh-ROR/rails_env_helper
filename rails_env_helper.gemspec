# frozen_string_literal: true

require_relative "lib/rails_env_helper/version"

Gem::Specification.new do |spec|
  spec.name = "rails_env_helper"
  spec.version = RailsEnvHelper::VERSION
  spec.authors = ["Bhuvanesh Ganesan"]
  spec.email = ["bhuvanesh@mallow-tech.com"]

  spec.summary       = "A helper gem for managing Rails environment variables"
  spec.description   = "Simplify working with environment variables in a Ruby on Rails application."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
  spec.add_dependency "rails", "~> 6.0"

  spec.metadata = {
    "allowed_push_host"   => 'https://rubygems.org',
    "homepage_uri"     => 'https://github.com/Bhuvanesh-ROR/rails_env_helper',
    "source_code_uri" => 'https://github.com/Bhuvanesh-ROR/rails_env_helper',
    "changelog_uri"      => 'https://github.com/Bhuvanesh-ROR/rails_env_helper/blob/main/CHANGELOG.md',
  }


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
