module ArrayIncludeMethods
  refine Array do
    # Returns `true` if all of the given `array` elements are present in `self`,
    # otherwise returns `false`
    # Always returns `true` if the given `array` is empty
    # Always returns `false` if the given `array` is nil
    def include_all?(array)
      return false if array.nil?
      array_include_other_array_same_class_elements = lambda do |a1, a2|
        (a1 & a2).uniq.sort == a2.uniq.sort
      end
      self_grouped_by = self.group_by(&:class)
      array_grouped_by = array.group_by(&:class)
      return false unless array_include_other_array_same_class_elements.call(self_grouped_by.keys.map(&:to_s), array_grouped_by.keys.map(&:to_s))
      array_grouped_by.reduce(true) do |result, pair|
        array_class = pair.first
        array_elements = pair.last
        self_grouped_by[array_class]
        result && array_include_other_array_same_class_elements.call(self_grouped_by[array_class], array_elements)
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
