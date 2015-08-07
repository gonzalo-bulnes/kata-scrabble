require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

RSpec::Core::RakeTask.new(:features) do |config|
    config.pattern = 'spec/features/**/*_spec.rb'
end

task default: :spec

