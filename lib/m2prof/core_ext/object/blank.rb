# Ruby's +Object+ class.
class Object
  # An object is blank if it's false, empty, or a whitespace string.
  # For example, +false+, '', ' ', +nil+, [], and {} are all blank.
  # @return [Boolean] if it's false, empty, or a whitespace string
  def blank?
    respond_to?(:empty) ? !!empty? : !self
  end

  # An object is present if it's not blank.
  # @return [Boolean] if it's not blank
  def present?
    !blank?
  end

  # Returns the receiver if present, otherwise +nil+.
  # @return [Object]
  def presence
    self if present?
  end
end

# Ruby's +NilClass+ class.
class NilClass
  # +nil+ is always blank.
  # @return [Boolean] true
  def blank?
    true
  end
end

# Ruby's +FalseClass+ class.
class FalseClass
  # +false+ is always blank.
  # @return [Boolean] true
  def blank?
    true
  end
end

# Ruby's +TrueClass+ class.
class TrueClass
  # +true+ is never blank.
  # @return [Boolean] false
  def blank?
    false
  end
end

# Ruby's +Array+ class.
class Array
  # Arrays are blank if they are empty.
  alias_method :blank?, :empty?
end

# Ruby's +Hash+ class.
class Hash
  # Hashes are blank if they are empty.
  alias_method :blank?, :empty?
end

# Ruby's +String+ class.
class String
  BLANK_RE = /\A[[:space:]]*\z/

  # A +String+ is blank only if it is empty
  # or contains only whitespace.
  def blank?
    empty? || BLANK_RE.match(self)
  end
end

# Ruby's +Numeric+ class.
class Numeric
  # Numbers are never blank.
  # @return [Boolean] false
  def blank?
    false
  end
end

# Ruby's +Time+ class.
class Time
  # Time is never blank.
  # @return [Boolean] false
  def blank?
    false
  end
end