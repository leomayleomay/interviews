#!/usr/bin/env rake

require 'rubygems'
require 'rspec/core/rake_task'

desc 'Default: run specs.'
task :default => [:spec]

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = "--tag ~todo --no-color --profile"
end
