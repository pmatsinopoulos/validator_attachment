current_path = File.expand_path("..", __FILE__)
$: << "../lib"
$: << current_path

require "validator_attachment"
require "dummy_validator"
