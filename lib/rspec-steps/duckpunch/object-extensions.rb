require 'rspec-steps/duckpunch/example-group'
require 'rspec-steps/stepwise'
require 'rspec/core/shared_example_group'

module RSpec::Core::SharedExampleGroup
  alias :shared_steps :shared_examples
end
