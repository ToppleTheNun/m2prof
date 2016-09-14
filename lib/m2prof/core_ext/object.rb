class Object
  # Checks if the Object is empty or nil
  # @return [boolean] empty or nil
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end
end