#!/usr/bin/env rake
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('validator_attachment') do |p|
  p.summary     = "Is this ActiveModel Validator Used?"
  p.description = "Checks whether an ActiveModel Validator is attached to an attribute of a Model and with which options"
  p.url         = "http://github.com/pmatsinopoulos/validator_attachment"
  p.author      = "Panayotis Matsinopoulos"
  p.email       = "panayotis@matsinopoulos.gr"
  p.ignore_pattern = ["tmp/*", "script/*", "rdoc_output/*", "rdoc_output/js/*", "rdoc_output/images/*", "rdoc_output/ActiveModel/*", "rdoc_output/lib/*",
                      "yard_output/*", "yard_output/js/*", "yard_output/css/*"]
  p.runtime_dependencies = ["rails >=3.0"]
  p.development_dependencies = ["rails >=3.0", "ruby-debug", 'ruby-debug-ide', 'ruby-debug-base']
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each{ |ext| load ext }

# additions to support testing

require 'rake/testtask'
require 'rdoc/task'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the validation_attachment gem,'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the validation_attachment gem.'
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ValidationAttachment'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

