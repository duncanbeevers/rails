$:.unshift(File.dirname(__FILE__) + '/../lib')
$:.unshift(File.dirname(__FILE__) + '/../../activesupport/lib')
$:.unshift(File.dirname(__FILE__) + '/fixtures/helpers')

require 'rubygems'
require 'yaml'
require 'stringio'
require 'test/unit'

gem 'mocha', '>= 0.9.0'
require 'mocha'

begin
  require 'ruby-debug'
  Debugger.start
rescue LoadError
  # Debugging disabled. `gem install ruby-debug` to enable.
end

require 'action_controller'
require 'action_controller/cgi_ext'
require 'action_controller/test_process'
require 'action_view/test_case'

# Show backtraces for deprecated behavior for quicker cleanup.
ActiveSupport::Deprecation.debug = true

ActionController::Base.logger = nil
ActionController::Routing::Routes.reload rescue nil

FIXTURE_LOAD_PATH = File.join(File.dirname(__FILE__), 'fixtures')
ActionView::PathSet::Path.eager_load_templates!
ActionController::Base.view_paths = FIXTURE_LOAD_PATH

def uses_mocha(test_name)
  yield
end
