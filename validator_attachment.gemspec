# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "validator_attachment"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Panayotis Matsinopoulos"]
  s.date = "2012-04-13"
  s.description = "Checks whether an ActiveModel Validator is attached to an attribute of a Model and with which options"
  s.email = "panayotis@matsinopoulos.gr"
  s.extra_rdoc_files = ["CHANGELOG", "README.rdoc", "lib/validator_attachment.rb"]
  s.files = ["CHANGELOG", "MIT-LICENSE", "README.rdoc", "Rakefile", "lib/validator_attachment.rb", "test/dummy_validator.rb", "test/test_helper.rb", "test/validator_attachment_test.rb", "validator_attachment.gemspec", "Manifest"]
  s.homepage = "http://github.com/pmatsinopoulos/validator_attachment"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Validator_attachment", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "validator_attachment"
  s.rubygems_version = "1.8.17"
  s.summary = "Is this ActiveModel Validator Used?"
  s.test_files = ["test/validator_attachment_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.0"])
      s.add_development_dependency(%q<rails>, ["~> 3.0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0"])
      s.add_dependency(%q<rails>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0"])
    s.add_dependency(%q<rails>, ["~> 3.0"])
  end
end
