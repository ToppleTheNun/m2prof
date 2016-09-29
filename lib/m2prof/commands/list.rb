require 'm2prof'

module M2Prof
  module Commands
    # Command to list the available settings files.
    # @author Richard Harrah
    class List
      # Method to handle arguments and options passed
      # to this class by commander.
      # @param args [Array<String>] arguments passed to this command
      # @param options [::Commander::Options] options (flags) passed
      #     to this command
      # @return [void]
      # rubocop:disable UnusedMethodArgument
      def handle(*args, options)
        settings_dir = M2Prof.m2_settings_home
        settings_files = Dir["#{settings_dir}/settings*.xml"]
        settings_files.each { |settings_file|
          base = File.basename(settings_file)
          next if base == 'settings.xml' or base == 'settings_default.xml'
          puts "#{base.sub('settings', '').sub('.xml', '')}"
        }
        puts 'default'
        nil
      end
      # rubocop:enable UnusedMethodArgument
    end
  end
end
