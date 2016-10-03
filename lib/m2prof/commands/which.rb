require 'm2prof'

module M2Prof
  module Commands
    # Command to determine which settings file is currently being used.
    # @author Richard Harrah
    class Which
      # Method to handle arguments and options passed
      # to this class by commander.
      # @param args [Array<String>] arguments passed to this command
      # @param options [::Commander::Command::Options] options (flags) passed
      #     to this command
      # @return [void]
      def handle(*args, options)
        settings_dir = M2Prof.m2_settings_home
        settings_file = "#{settings_dir}/settings.xml"
        unless File.exist?(settings_file)
          puts 'default'
          return nil
        end
        unless File.symlink?(settings_file)
          puts 'default'
          return nil
        end
        linked_settings_file = File.readlink(settings_file)
        file_base_name = File.basename(linked_settings_file)
        puts "#{M2Prof::Sanitizer.sanitize(file_base_name.sub('settings', '').sub('.xml', '').strip)}"
      end
    end
  end
end
