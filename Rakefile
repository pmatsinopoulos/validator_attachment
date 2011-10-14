require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('validator_attachment', '0.3.0') do |p|
  p.summary     = "Is this ActiveModel Validator Used?"
  p.description = "Checks whether an ActiveModel Validator is attached to an attribute of a Model and with which options"
  p.url         = "http://github.com/pmatsinopoulos/validator_attachment"
  p.author      = "Panayotis Matsinopoulos"
  p.email       = "panayotis@matsinopoulos.gr"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each{ |ext| load ext }


