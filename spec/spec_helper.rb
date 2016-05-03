require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |c|
  # Nice output
  c.color = true
  c.tty = true
  c.formatter = :documentation
  # log level
  c.log_level = :fatal
  # Test platform
  c.platform = 'centos'
  c.version = '7.0'
end
