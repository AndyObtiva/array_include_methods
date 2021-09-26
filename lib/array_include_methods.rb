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
    # `same_sort` option indicates that array must have the same sort as `self`. By default, it is `false`
    def include_all?(*array, same_sort: false)
      return false if array.size > self.size
      self_copy = self.dup
      array_copy = array.dup
      book_keeping_array_copy = array.dup
      self_element_index = last_element_index = -1
      array_copy.each do |element|
        if self_copy.include?(element)
          last_element_index = self_element_index
          self_element_index = self_copy.index(element)
          return false if same_sort && self_element_index < last_element_index
          self_copy.delete_at(self_element_index)
          book_keeping_array_copy.delete(element)
        else
          return false
        end
      end
      book_keeping_array_copy.empty?
    end

    # Returns `true` if the given `array` is present in `self` (in the same element order without repetition)
    # Always returns `true` if the given `array` is empty
    # Always returns `false` if the given `array` is nil
    def include_array?(array)
      return false if array.nil?
      if array.size > self.size
        false
      else
        size_diff = self.size - array.size
        (size_diff + 1).times.any? do |start_index|
          self[start_index, array.size] == array
        end
      end
    end

    # Returns `true` if any of the given `array` elements are present in `self`,
    # otherwise returns `false`
    # Always returns `true` if the given `array` is empty
    def include_any?(*array)
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
    
    def array_intersection_indexes(array)
      array_intersection_and_diff_indexes(array)[:intersection_indexes]
    end
    alias array_intersection_indices array_intersection_indexes
    
    def array_diff_indexes(array)
      array_intersection_and_diff_indexes(array)[:diff_indexes]
    end
    alias array_diff_indices array_diff_indexes
    
    private
    
    def array_intersection_and_diff_indexes(array)
      return {intersection_indexes: [], diff_indexes: self.size.times.to_a} if array.nil?
      intersection_indexes = []
      diff_indexes = []
      array_current_index = 0
      each_with_index do |element, index|
        if element == array[array_current_index]
          intersection_indexes << index
          array_current_index += 1
        else
          diff_indexes << index
        end
      end
      {
        intersection_indexes: intersection_indexes,
        diff_indexes: diff_indexes
      }
    end
  end
end
if RUBY_PLATFORM == 'opal'
  # Create a shim using method that does nothing since we monkey-patch in Opal earlier in `refine` method
  def self.using(refinement)
    # NO OP
  end
end
