module M2Prof
  # Module that contains logic for cleaning +String+s.
  # @author Richard Harrah
  module Sanitizer
    # Sanitize a +String+ by removing any non-alphanumeric
    # characters from the beginning or end of strings.
    # @param str_to_sanitize [String] the +String+ to sanitize
    # @return [String] sanitized +String+
    def self.sanitize(str_to_sanitize)
      if str_to_sanitize.nil? or str_to_sanitize.empty?
        raise ArgumentError, 'str_to_sanitize cannot be nil or empty'
      end
      unless str_to_sanitize.is_a?(String)
        raise ArgumentError, 'str_to_sanitize must be a String'
      end
      str_to_sanitize.strip.sub(/^[\W_]+/, '').sub(/[\W_]+$/, '').strip
    end
  end
end