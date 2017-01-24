require 'rspec-steps/builder'
require 'rspec-steps/describer'

module RSpec::Steps
  def self.warnings
    @warnings ||= Hash.new do |h,warning|
      puts warning #should be warn, but RSpec complains
      h[warning] = true
    end
  end

  SharedSteps = {}

  module DSL
    def steps(*args, &block)
      describer = Describer.new(args, {:caller => caller}, &block)
      builder = Builder.new(describer)

      builder.build_example_group
    end

    def shared_steps(*args, &block)
      name = args.first
      raise "shared step lists need a String for a name" unless name.is_a? String
      raise "there is already a step list named #{name}" if SharedSteps.has_key?(name)
      SharedSteps[name] = Describer.new(args, {:caller => caller}, &block)
    end
  end
  extend DSL
end
