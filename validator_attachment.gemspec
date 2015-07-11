# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'validator_attachment/version'

Gem::Specification.new do |s|
  s.name = "validator_attachment"
  s.version = ValidatorAttachment::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Panayotis Matsinopoulos"]
  s.date = "2015-07-12"
  s.description = "Checks whether an ActiveModel Validator is attached to an attribute of a Model and with which options"
  s.email = "panayotis@matsinopoulos.gr"
  s.extra_rdoc_files = ["CHANGELOG", "README.rdoc", "lib/validator_attachment.rb"]
  s.files = ["CHANGELOG", "MIT-LICENSE", "README.rdoc", "Rakefile", "lib/validator_attachment.rb", "spec/dummy_validator.rb", "spec/spec_helper.rb", "spec/validator_attachment_spec.rb", "validator_attachment.gemspec", "Manifest"]
  s.homepage = "http://github.com/pmatsinopoulos/validator_attachment"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Validator_attachment", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "validator_attachment"
  s.rubygems_version = "2.2.2"
  s.summary = "Is this ActiveModel Validator Used?"
  s.test_files = ["spec/validator_attachment_spec.rb", "spec/spec_helper.rb", "spec/dummy_validator.rb"]

  s.add_runtime_dependency('rails', "~> 4.0")
  s.add_development_dependency('bundler')
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
  s.add_development_dependency('rails', "~> 4.0")
end
