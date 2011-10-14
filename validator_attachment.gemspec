# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{validator_attachment}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Panayotis Matsinopoulos}]
  s.date = %q{2011-10-14}
  s.description = %q{Checks whether an ActiveModel Validator is attached to an attribute of a Model and with which options}
  s.email = %q{panayotis@matsinopoulos.gr}
  s.extra_rdoc_files = [%q{CHANGELOG}, %q{README.rdoc}, %q{lib/validator_attachment.rb}]
  s.files = [%q{CHANGELOG}, %q{README.rdoc}, %q{Rakefile}, %q{lib/validator_attachment.rb}, %q{validator_attachment.gemspec}, %q{Manifest}]
  s.homepage = %q{http://github.com/pmatsinopoulos/validator_attachment}
  s.rdoc_options = [%q{--line-numbers}, %q{--inline-source}, %q{--title}, %q{Validator_attachment}, %q{--main}, %q{README.rdoc}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{validator_attachment}
  s.rubygems_version = %q{1.8.8}
  s.summary = %q{Is this ActiveModel Validator Used?}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
