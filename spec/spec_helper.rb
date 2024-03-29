require 'simplecov'
require 'simplecov-lcov'
require 'coveralls' if ENV['TRAVIS']

ENV['APP_ENV'] = 'test'

SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
formatters = []
formatters << SimpleCov::Formatter::LcovFormatter
formatters << Coveralls::SimpleCov::Formatter if ENV['TRAVIS']
SimpleCov.formatters = formatters
SimpleCov.start do
  add_filter(/^\/spec\//)
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'puts_debuggerer'
require 'rspec'
ORIGINAL_RUBY_ENGINE = RUBY_ENGINE
MAIN = self

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

end
