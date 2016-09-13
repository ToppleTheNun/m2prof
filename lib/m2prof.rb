require 'm2prof/version'

# Module that contains all of the m2prof code.
# @author Richard Harrah
module M2Prof
  # The root path for M2Prof source code files
  # @return [String] path to source code files
  ROOT = File.expand_path(File.dirname(__FILE__))
end

# Require all Ruby core extension classes automagically
Dir.glob(File.join(M2Prof::ROOT, 'm2prof', 'core_ext', '*.rb')).each do |file|
  require file
end

# Require autoload classes in order to ease compatibility
['autoload'].each do |file|
  require File.join(M2Prof::ROOT, 'm2prof', file)
end