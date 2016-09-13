# Returns the expanded path to the specified file, auto-prepends source root
# @return [String] expanded path to file
# @private
def __p(path)
  File.join(M2Prof::ROOT, 'm2prof', *path.split('/'));
end

module M2Prof
  autoload :Commands, __p('commands')
end