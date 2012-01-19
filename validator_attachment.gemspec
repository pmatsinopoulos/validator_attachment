# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{validator_attachment}
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Panayotis Matsinopoulos}]
  s.date = %q{2012-01-19}
  s.description = %q{Checks whether an ActiveModel Validator is attached to an attribute of a Model and with which options}
  s.email = %q{panayotis@matsinopoulos.gr}
  s.extra_rdoc_files = [%q{CHANGELOG}, %q{README.rdoc}, %q{lib/validator_attachment.rb}]
  s.files = [%q{CHANGELOG}, %q{MIT-LICENSE}, %q{README.rdoc}, %q{Rakefile}, %q{lib/validator_attachment.rb}, %q{test/dummy_validator.rb}, %q{test/test_helper.rb}, %q{test/validator_attachment_test.rb}, %q{validator_attachment.gemspec}, %q{Manifest}]
  s.homepage = %q{http://github.com/pmatsinopoulos/validator_attachment}
  s.rdoc_options = [%q{--line-numbers}, %q{--inline-source}, %q{--title}, %q{Validator_attachment}, %q{--main}, %q{README.rdoc}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{validator_attachment}
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Is this ActiveModel Validator Used?}
  s.test_files = [%q{test/validator_attachment_test.rb}, %q{test/test_helper.rb}]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.0"])
      s.add_development_dependency(%q<rails>, ["~> 3.0.0"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug-ide>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug-base>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0.0"])
      s.add_dependency(%q<rails>, ["~> 3.0.0"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<ruby-debug-ide>, [">= 0"])
      s.add_dependency(%q<ruby-debug-base>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0.0"])
    s.add_dependency(%q<rails>, ["~> 3.0.0"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<ruby-debug-ide>, [">= 0"])
    s.add_dependency(%q<ruby-debug-base>, [">= 0"])
  end
end
