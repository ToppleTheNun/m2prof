# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'm2prof/version'

Gem::Specification.new do |spec|
  spec.name = 'm2prof'
  spec.version = M2Prof::VERSION
  spec.authors = ['Richard Harrah']
  spec.email = ['topplethenunnery@gmail.com']

  spec.summary = %q{A simple command-line utility to manage different Maven settings.}
  spec.homepage = 'https://github.com/Nunnery/m2prof'
  spec.licenses = ['MIT']

  spec.required_ruby_version = '>= 2.0.0'

  glob = lambda { |patterns| spec.files & Dir[*patterns] }

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.test_files = glob['{spec/{**/}*_spec.rb']
  spec.extra_rdoc_files = glob['*.{txt,rdoc}']

  spec.add_dependency 'commander', '~> 4.4'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 11.2'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.1'
  spec.add_development_dependency 'yard', '~> 0.8'
  spec.add_development_dependency 'fuubar', '~> 2.2'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.6'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_development_dependency 'inch', '~> 0.7'
end
