require 'rspec/core/rake_task'

namespace :spec do

  RSpec::Core::RakeTask.new(:public) do |config|
    config.rspec_opts = '--tag ~private --tag ~protected'
  end

  RSpec::Core::RakeTask.new(:development) do |config|
    config.rspec_opts = '--tag private --tag protected'
  end
end

RSpec::Core::RakeTask.new(:features) do |config|
  config.pattern = 'spec/features/**/*_spec.rb'
end

begin
  require 'inch/rake'

  Inch::Rake::Suggest.new(:inch) do |suggest|
    suggest.args << "--private"
    suggest.args << "--pedantic"
  end
rescue LoadError
  desc 'Inch rake task not available'
    task :inch do
      abort 'Inch rake task is not available. Be sure to install inch as a gem or plugin'
  end
end

task default: ['spec:public', 'spec:development', :inch]

