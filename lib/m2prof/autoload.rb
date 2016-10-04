# Returns the expanded path to the specified file, auto-prepends source root
# @param path [String] path to file
# @return [String] expanded path to file
# @private
def __p(path)
  File.join(M2Prof::ROOT, 'm2prof', *path.split('/'));
end

module M2Prof
  autoload :Commands, __p('commands')
  autoload :Sanitizer, __p('utils/sanitizer')
  autoload :Wizardry, __p('utils/wizardry')
end