module M2Prof
  # Module that contains all of the commands used by
  # m2prof.
  # @author Richard Harrah
  module Commands
    autoload :List, 'm2prof/commands/list'
    autoload :Use, 'm2prof/commands/use'
    autoload :Which, 'm2prof/commands/which'
  end
end