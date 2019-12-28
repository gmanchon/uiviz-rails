# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uiviz/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'uiviz-rails'
  spec.version       = Uiviz::Rails::VERSION
  spec.authors       = ['Gaetan Manchon']
  spec.email         = ['gmanchon@gmail.com']

  spec.summary       = %(a small hello world gem)
  spec.description   = %(fill me later)
  spec.homepage      = 'https://github.com/gmanchon/uiviz-rails'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = 'http://mygemserver.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/gmanchon/uiviz-rails'
  spec.metadata['changelog_uri'] = 'https://github.com/gmanchon/uiviz-rails/releases'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem added to git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split('\x0')
                     .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
