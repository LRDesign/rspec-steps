Gem::Specification.new do |spec|
  spec.name		= "rspec-steps"
  spec.version		= "0.3.1"
  author_list = {
    "Judson Lester" => "judson@lrdesign.com",
    "Evan Dorn" => "evan@lrdesign.com"
  }
  spec.authors		= author_list.keys
  spec.email		= spec.authors.map {|name| author_list[name]}
  spec.summary		= "I want steps in RSpec"
  spec.description	= <<-EOD
  I don't like Cucumber.  I don't need plain text stories.  My clients either
  read code or don't read any test documents, so Cucumber is mostly useless to me.
  But often, especially in full integration tests, it would be nice to have
  steps in a test.
  EOD

  spec.rubyforge_project= spec.name.downcase
  spec.homepage        = "https://github.com/LRDesign/rspec-steps"
  spec.required_rubygems_version = Gem::Requirement.new(">= 0") if spec.respond_to? :required_rubygems_version=


  # Do this: d$@"
  spec.files		= %w[
  lib/rspec-steps.rb
  lib/rspec-steps/stepwise.rb
  lib/rspec-steps/duckpunch/example-group.rb
  lib/rspec-steps/duckpunch/example.rb
  lib/rspec-steps/duckpunch/object-extensions.rb
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
    ["corundum", ">= 0.0.25"],
  ]
  if spec.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
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

  spec.add_dependency("rspec", ">= 2.6", "< 2.99")

  spec.post_install_message = "Another tidy package brought to you by Judson Lester of Logical Reality Design"
end
