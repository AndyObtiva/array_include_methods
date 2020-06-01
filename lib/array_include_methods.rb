module ArrayIncludeMethods
  refine Array do
    # Returns `true` if all of the given `array` elements are present in `self`,
    # otherwise returns `false`
    # Always returns `true` if the given `array` is empty
    # Always returns `false` if the given `array` is nil
    def include_all?(array)
      return false if array.nil?
      if map(&:class).uniq.size == 1 && array.map(&:class).uniq.size == 1
        (self & array).uniq.sort == array.uniq.sort
      else
        array.reduce(true) { |result, element| result && include?(element) }
      end    
    end

    # Returns `true` if any of the given `array` elements are present in `self`,
    # otherwise returns `false`
    # Always returns `true` if the given `array` is empty
    # Always returns `false` if the given `array` is nil
    def include_any?(array)
      !array.nil? && (array.empty? || !(self & array).empty?)
    end
  end
end
