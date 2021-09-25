module ArrayIncludeMethods
  if RUBY_PLATFORM == 'opal'
    def self.refine(class_or_module, &refinement)
      class_or_module.class_eval(&refinement)
    end
  end
  refine Array do
    # Returns `true` if all of the given `array` elements are present in `self`,
    # otherwise returns `false`
    # Always returns `true` if the given `array` is empty
    # Always returns `false` if the given `array` is nil
    def include_all?(*array)
      array_argument = false
      if array.size == 1 && array[0].is_a?(Array)
        array_argument = true
        array = array[0]
      end
      return false if array.nil?
      array_include_other_array_same_class_elements = lambda do |a1, a2|
        begin
          if array_argument
            if a2.size > a1.size
              false
            else
              size_diff = a1.size - a2.size
              (size_diff + 1).times.any? do |start_index|
                a1[start_index, a2.size] == a2
              end
            end
          else
            (a1 & a2).uniq.sort == a2.uniq.sort
          end
        rescue ArgumentError => e
          a2.uniq.all? { |element| a1.include?(element) }
        end
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
    def include_any?(*array)
      array = array[0] if array.size == 1 && array[0].is_a?(Array)
      !array.nil? && (array.empty? || !(self & array).empty?)
    end
    
    def array_index(array)
      result_array_index = -1
      return result_array_index if array.nil?
      if array.size <= self.size
        size_diff = self.size - array.size
        current_array_index = nil
        result = (size_diff + 1).times.any? do |start_index|
          current_array_index = start_index
          self[start_index, array.size] == array
        end
        result_array_index = current_array_index if result
      end
      result_array_index
    end
  end
end
if RUBY_PLATFORM == 'opal'
  # Create a shim using method that does nothing since we monkey-patch in Opal earlier in `refine` method
  def self.using(refinement)
    # NO OP
  end
end
