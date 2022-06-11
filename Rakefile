# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "array_include_methods"
  gem.homepage = "http://github.com/AndyObtiva/array_include_methods"
  gem.license = "MIT"
  gem.summary = %Q{Array#include_all? & Array#include_any? methods missing from basic Ruby Array API}
  gem.description = %Q{Array#include_all?, Array#include_any?, Array#include_array?, Array#array_index, Array#array_diff_indices, and Array#array_intersection_indices methods missing from basic Ruby Array API. Compatible with Ruby, JRuby, Opal, and RubyMotion.}
  gem.email = "andy.am@gmail.com"
  gem.authors = ["Andy Maleh"]
  gem.files = Dir['LICENSE.txt', 'README.md', 'CHANGELOG.md', 'array_include_methods.gemspec', 'VERSION', 'lib/**/*.rb']
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "array_include_methods #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
