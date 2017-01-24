Gem::Specification.new do |spec|
  spec.name		= "rspec-steps"
  spec.version		= "2.1.2"
  author_list = {
    "Judson Lester" => "judson@lrdesign.com",
    "Evan Dorn" => "evan@lrdesign.com"
  }
  spec.authors		= author_list.keys
  spec.email		= spec.authors.map {|name| author_list[name]}
  spec.summary		= "I want steps in RSpec"
  spec.description	= <<-EOD
  A minimal implementation of integration testing within RSpec.
  Allows you to build sequential specs, each with a description,
  but where state is maintained between tests and before/after actions are only
  triggered at the beginning and end of the entire sequence.  Cool things you
  can do with this:

  * Build multi-step user stories in plain RSpec syntax. Locate the point of
    failure quickly, and break up large integrations into sensible steps
  * Speed up groups of related tests by running your factories only once before
    the whole group.

  EOD

  spec.rubyforge_project= spec.name.downcase
  spec.homepage        = "https://github.com/LRDesign/rspec-steps"
  spec.required_rubygems_version = Gem::Requirement.new(">= 0") if spec.respond_to? :required_rubygems_version=


  spec.files		= %w[
  lib/rspec-steps.rb

  lib/rspec-steps/step-list.rb
  lib/rspec-steps/describer.rb
  lib/rspec-steps/step.rb
  lib/rspec-steps/dsl.rb
  lib/rspec-steps/builder.rb
  lib/rspec-steps/hook.rb
  lib/rspec-steps/step-result.rb
  lib/rspec-steps/lets.rb
  lib/rspec-steps/modules.rb
  lib/rspec-steps/monkeypatching.rb
  doc/README
  doc/Specifications
  spec/example_group_spec.rb
  spec_help/spec_helper.rb
  spec_help/gem_test_suite.rb
  spec_help/rspec-sandbox.rb
  spec_help/ungemmer.rb
  spec_help/file-sandbox.rb
  ]

  spec.test_file        = "spec_help/gem_test_suite.rb"
  spec.licenses = ["MIT"]
  spec.require_paths = %w[lib/]
  spec.rubygems_version = "1.3.5"

  dev_deps = [
    ["corundum", ">= 0.4.0"],
    ["metric_fu", "~> 4.11.1"],
  ]
  if spec.respond_to? :specification_version then
    spec.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      dev_deps.each do |gem, versions|
        spec.add_development_dependency(gem, versions)
      end
    else
      dev_deps.each do |gem, versions|
        spec.add_dependency(gem, versions)
      end
    end
  else
    dev_deps.each do |gem, versions|
      spec.add_dependency(gem, versions)
    end
  end

  spec.has_rdoc		= true
  spec.extra_rdoc_files = Dir.glob("doc/**/*")
  spec.rdoc_options	= %w{--inline-source }
  spec.rdoc_options	+= %w{--main doc/README }
  spec.rdoc_options	+= ["--title", "#{spec.name}-#{spec.version} RDoc"]

  spec.add_dependency("rspec", ">= 3.0", "< 3.99")

  #spec.post_install_message = "Another tidy package brought to you by Judson
  #Lester of Logical Reality Design"
end
