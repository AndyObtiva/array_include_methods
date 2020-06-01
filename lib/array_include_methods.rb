module ArrayIncludeMethods
  refine Array do
    # Returns `true` if all of the given `array` elements are present in `self`,
    # otherwise returns `false`
    # Always returns `true` if the given `array` is empty
    # Always returns `false` if the given `array` is nil
    def include_all?(*array)
      return if array.nil?
      array = array.first if array.size == 1 && array.first.is_a?(Array)
      self & array == array
    end

    # Returns `true` if any of the given `array` elements are present in `self`,
    # otherwise returns `false`
    # Always returns `true` if the given `array` is empty
    # Always returns `false` if the given `array` is nil
    def include_any?(*array)
      return if array.nil?
      array = array.first if array.size == 1 && array.first.is_a?(Array)
      array.empty? || !(self & array).empty?
    end
  end
end
