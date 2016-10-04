require 'm2prof/utils/sanitizer'

module M2Prof
  # Module that contains any common logic for M2Prof.
  # @author Richard Harrah
  module Wizardry
    # Fetches the sanitized names of all usable settings files for
    # use by M2Prof.
    # @return [Array<String>] sanitized names of settings files
    def self.fetch_sanitized_settings
      sanitized_settings = []
      settings_dir = M2Prof.m2_settings_home
      settings_files = Dir["#{settings_dir}/settings*.xml"]
      settings_files.each { |settings_file|
        base = File.basename(settings_file)
        next if base == 'settings.xml' or base == 'settings_default.xml'
        sanitized_settings << "#{M2Prof::Sanitizer.sanitize(base.sub('settings', '').sub('.xml', '').strip)}"
      }
      sanitized_settings << 'default'
      sanitized_settings
    end
  end
end